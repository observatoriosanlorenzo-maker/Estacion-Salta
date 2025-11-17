create table stations (
  id uuid primary key default uuid_generate_v4(),
  name text not null,
  latitude float8,
  longitude float8,
  automatic boolean default true,
  observer boolean default false,
  updated_at timestamptz default now()
);

create table observations (
  id uuid primary key default uuid_generate_v4(),
  station_id uuid references stations(id) on delete cascade,
  temperature numeric,
  humidity numeric,
  pressure numeric,
  wind_speed numeric,
  wind_gust numeric,
  visibility numeric,
  cloud_cover numeric,
  cloud_height numeric,
  present_weather text,
  synop_code text,
  manual boolean default false,
  created_at timestamptz default now()
);
