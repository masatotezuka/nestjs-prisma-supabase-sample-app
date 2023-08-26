create sequence "public"."Todo_id_seq";

create table "public"."Todo" (
    "id" integer not null default nextval('"Todo_id_seq"'::regclass),
    "title" text not null,
    "description" text not null,
    "done" boolean not null default false,
    "createdAt" timestamp(3) without time zone not null default CURRENT_TIMESTAMP
);


create table "public"."_prisma_migrations" (
    "id" character varying(36) not null,
    "checksum" character varying(64) not null,
    "finished_at" timestamp with time zone,
    "migration_name" character varying(255) not null,
    "logs" text,
    "rolled_back_at" timestamp with time zone,
    "started_at" timestamp with time zone not null default now(),
    "applied_steps_count" integer not null default 0
);


alter sequence "public"."Todo_id_seq" owned by "public"."Todo"."id";

CREATE UNIQUE INDEX "Todo_description_key" ON public."Todo" USING btree (description);

CREATE UNIQUE INDEX "Todo_pkey" ON public."Todo" USING btree (id);

CREATE UNIQUE INDEX _prisma_migrations_pkey ON public._prisma_migrations USING btree (id);

alter table "public"."Todo" add constraint "Todo_pkey" PRIMARY KEY using index "Todo_pkey";

alter table "public"."_prisma_migrations" add constraint "_prisma_migrations_pkey" PRIMARY KEY using index "_prisma_migrations_pkey";


