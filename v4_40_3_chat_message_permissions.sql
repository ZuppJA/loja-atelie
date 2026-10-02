-- V4.40.3 — regras estritas de edição/exclusão do chat
-- 1) não lida + não respondida => Editar + Excluir
-- 2) lida + não respondida     => apenas Excluir
-- 3) lida + respondida         => Sem opções

create or replace function public.get_seller_chat_message_actions(p_message_id uuid)
returns table(can_edit boolean, can_delete boolean)
language sql stable security definer set search_path=public
as $function$
with actor as (
  select id, role from public.profiles
  where id=auth.uid() and status='active'::public.user_status
), target as (
  select m.id,m.chat_id,m.sender_id,m.created_at,m.deleted_at,
         c.conversation_type,c.status,a.role actor_role
  from public.seller_chat_messages m
  join public.seller_chats c on c.id=m.chat_id
  join actor a on true
  where m.id=p_message_id
), accessible as (
  select t.* from target t
  where t.sender_id=auth.uid() and t.deleted_at is null and (
    (t.conversation_type='seller_customer'
      and t.actor_role<>'admin'::public.user_role
      and exists(select 1 from public.seller_chats c where c.id=t.chat_id and (c.seller_id=auth.uid() or c.customer_id=auth.uid())))
    or
    (t.conversation_type in('customer_support','seller_support')
      and t.status<>'closed'
      and (
        exists(select 1 from public.seller_chats c where c.id=t.chat_id and c.customer_id=auth.uid())
        or (t.actor_role='admin'::public.user_role and exists(select 1 from public.seller_chats c where c.id=t.chat_id and c.assigned_agent_id=auth.uid()))
      ))
    or
    (t.conversation_type='management_internal'
      and t.actor_role='admin'::public.user_role
      and exists(select 1 from public.seller_chat_participants p where p.chat_id=t.chat_id and p.user_id=auth.uid()))
  )
), flags as (
  select a.*,
    exists(select 1 from public.seller_chat_participants p where p.chat_id=a.chat_id and p.user_id<>auth.uid() and p.last_read_at is not null and p.last_read_at>=a.created_at) recipient_read,
    exists(select 1 from public.seller_chat_messages reply where reply.chat_id=a.chat_id and reply.sender_id<>auth.uid() and reply.created_at>a.created_at) recipient_replied
  from accessible a
)
select ((not recipient_read) and (not recipient_replied)) as can_edit,
       (not recipient_replied) as can_delete
from flags;
$function$;
grant execute on function public.get_seller_chat_message_actions(uuid) to authenticated;

create or replace function public.get_seller_chat_message_actions_bulk(p_chat_id uuid)
returns table(message_id uuid, can_edit boolean, can_delete boolean)
language sql stable security definer set search_path=public
as $function$
with actor as (
  select id, role from public.profiles
  where id=auth.uid() and status='active'::public.user_status
), target as (
  select m.id,m.chat_id,m.sender_id,m.created_at,m.deleted_at,
         c.conversation_type,c.status,a.role actor_role
  from public.seller_chat_messages m
  join public.seller_chats c on c.id=m.chat_id
  join actor a on true
  where m.chat_id=p_chat_id
), accessible as (
  select t.* from target t
  where t.sender_id=auth.uid() and t.deleted_at is null and (
    (t.conversation_type='seller_customer'
      and t.actor_role<>'admin'::public.user_role
      and exists(select 1 from public.seller_chats c where c.id=t.chat_id and (c.seller_id=auth.uid() or c.customer_id=auth.uid())))
    or
    (t.conversation_type in('customer_support','seller_support')
      and t.status<>'closed'
      and (
        exists(select 1 from public.seller_chats c where c.id=t.chat_id and c.customer_id=auth.uid())
        or (t.actor_role='admin'::public.user_role and exists(select 1 from public.seller_chats c where c.id=t.chat_id and c.assigned_agent_id=auth.uid()))
      ))
    or
    (t.conversation_type='management_internal'
      and t.actor_role='admin'::public.user_role
      and exists(select 1 from public.seller_chat_participants p where p.chat_id=t.chat_id and p.user_id=auth.uid()))
  )
), flags as (
  select a.id,
    exists(select 1 from public.seller_chat_participants p where p.chat_id=a.chat_id and p.user_id<>auth.uid() and p.last_read_at is not null and p.last_read_at>=a.created_at) recipient_read,
    exists(select 1 from public.seller_chat_messages reply where reply.chat_id=a.chat_id and reply.sender_id<>auth.uid() and reply.created_at>a.created_at) recipient_replied
  from accessible a
)
select id as message_id,
       ((not recipient_read) and (not recipient_replied)) as can_edit,
       (not recipient_replied) as can_delete
from flags;
$function$;
revoke all on function public.get_seller_chat_message_actions_bulk(uuid) from public;
grant execute on function public.get_seller_chat_message_actions_bulk(uuid) to authenticated;
