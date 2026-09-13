-- Fios & Artes V4.12
-- Já aplicada no projeto Supabase em 2026-09-13.
-- Regras: preço promocional como sale_price, categorias múltiplas,
-- estoque inicial >= 1, publication_status e índices de FKs.

create index if not exists cart_items_product_id_idx on public.cart_items(product_id);
create index if not exists category_requests_reviewed_by_idx on public.category_requests(reviewed_by);
create index if not exists comments_product_id_idx on public.comments(product_id);
create index if not exists comments_user_id_idx on public.comments(user_id);
create index if not exists favorites_product_id_idx on public.favorites(product_id);
create index if not exists product_images_product_id_idx on public.product_images(product_id);
create index if not exists products_category_id_idx on public.products(category_id);
create index if not exists products_seller_id_idx on public.products(seller_id);
create index if not exists seller_requests_reviewed_by_idx on public.seller_requests(reviewed_by);

create or replace function public.sync_product_pricing()
returns trigger language plpgsql set search_path = public as $$
begin
  if new.sale_price is null or new.sale_price >= new.price then
    new.sale_price := null;
    new.discount_percent := 0;
  else
    new.discount_percent := round(((new.price - new.sale_price) / nullif(new.price, 0)) * 100, 2);
  end if;
  return new;
end;
$$;

create or replace function public.validate_new_product_stock()
returns trigger language plpgsql set search_path = public as $$
begin
  if new.stock < 1 then
    raise exception 'O estoque inicial do produto deve ser de pelo menos 1 unidade.' using errcode = '23514';
  end if;
  return new;
end;
$$;

 drop trigger if exists trg_sync_product_pricing on public.products;
 create trigger trg_sync_product_pricing before insert or update of price, sale_price on public.products
 for each row execute function public.sync_product_pricing();

 drop trigger if exists trg_validate_new_product_stock on public.products;
 create trigger trg_validate_new_product_stock before insert on public.products
 for each row execute function public.validate_new_product_stock();

alter function public.sync_product_publication_status() set search_path = public;
alter table public.products alter column category_id set not null;
alter table public.products drop constraint if exists products_category_id_fkey;
alter table public.products add constraint products_category_id_fkey foreign key (category_id) references public.categories(id) on delete restrict;
