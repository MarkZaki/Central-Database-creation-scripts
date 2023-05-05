CREATE TABLE "Authority" (
  "id" int PRIMARY KEY,
  "name" varchar(255),
  "abbreviation" varchar(255),
  "contact_person_id" int,
  "address_id" int
);

CREATE TABLE "Contact_Person" (
  "id" int PRIMARY KEY,
  "first_name" varchar(255),
  "last_name" varchar(255),
  "email" varchar(255),
  "phone_number" varchar(20)
);

CREATE TABLE "Address" (
  "id" int PRIMARY KEY,
  "street" varchar(255),
  "state" varchar(255),
  "country_id" int,
  "region_id" int,
  "postal_code" varchar(20)
);

CREATE TABLE "Country" (
  "id" int PRIMARY KEY,
  "country_name" varchar(255),
  "country_abbreviation" varchar(10),
  "wmo_country_name" varchar(255),
  "wmo_country_code" varchar(255)
);

CREATE TABLE "Region" (
  "id" int PRIMARY KEY,
  "region_name" varchar(255),
  "region_abbreviation" varchar(10),
  "wmo_region_name" varchar(255)
);

CREATE TABLE "Rain_Gauge" (
  "id" int PRIMARY KEY,
  "name" varchar(255),
  "elevation" decimal(10,6),
  "manufacturer" varchar(255),
  "model" varchar(255),
  "in_service" boolean,
  "installation_date" date,
  "relocation_date" date,
  "opening_date" date,
  "closing_date" date,
  "height_angles" varchar(255),
  "lee_index" varchar(255),
  "notes" text,
  "gauge_type" varchar(255),
  "windshield_type" varchar(255),
  "barometer_height" decimal(10,6),
  "service_visits" text,
  "sensor_type" varchar(255),
  "error_information" text,
  "photo_link" varchar(255),
  "digital_twin_link" varchar(255),
  "drawing_link" varchar(255),
  "land_use_changes" text,
  "ground_level_msl" decimal(10,6),
  "additional_height" decimal(10,6),
  "orifice_level" decimal(10,6),
  "location_id" int
);

CREATE TABLE "Location" (
  "id" int PRIMARY KEY,
  "name" varchar(255),
  "location" varchar(255),
  "latitude" decimal(10,6),
  "longitude" decimal(10,6),
  "identity" varchar(255),
  "address_id" int,
  "environment" varchar(255),
  "alias" varchar(255),
  "authority_id" int,
  "notes" text
);

CREATE TABLE "Time_Series" (
  "id" int PRIMARY KEY,
  "gauge_id" int,
  "date_time" timestamp,
  "value" decimal(10,6),
  "unit" varchar(10),
  "data_received" timestamp,
  "is_dummy" boolean,
  "error" text,
  "license" varchar(255)
);

CREATE TABLE "Weather_Radar" (
  "id" int PRIMARY KEY,
  "name" varchar(255),
  "manufacturer" varchar(255),
  "model" varchar(255),
  "weather_radar_type" varchar(255),
  "opening_date" date,
  "closing_date" date,
  "location_id" int
);

CREATE TABLE "Image_Time_Series" (
  "id" int PRIMARY KEY,
  "weather_radar_id" int,
  "date_time" timestamp,
  "image" bytea,
  "license" varchar(255)
);

ALTER TABLE "Authority" ADD FOREIGN KEY ("contact_person_id") REFERENCES "Contact_Person" ("id");

ALTER TABLE "Authority" ADD FOREIGN KEY ("address_id") REFERENCES "Address" ("id");

ALTER TABLE "Address" ADD FOREIGN KEY ("country_id") REFERENCES "Country" ("id");

ALTER TABLE "Address" ADD FOREIGN KEY ("region_id") REFERENCES "Region" ("id");

ALTER TABLE "Rain_Gauge" ADD FOREIGN KEY ("location_id") REFERENCES "Location" ("id");

ALTER TABLE "Location" ADD FOREIGN KEY ("address_id") REFERENCES "Address" ("id");

ALTER TABLE "Location" ADD FOREIGN KEY ("authority_id") REFERENCES "Authority" ("id");

ALTER TABLE "Time_Series" ADD FOREIGN KEY ("gauge_id") REFERENCES "Rain_Gauge" ("id");

ALTER TABLE "Weather_Radar" ADD FOREIGN KEY ("location_id") REFERENCES "Location" ("id");

ALTER TABLE "Image_Time_Series" ADD FOREIGN KEY ("weather_radar_id") REFERENCES "Weather_Radar" ("id");
