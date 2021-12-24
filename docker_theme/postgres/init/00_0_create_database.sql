
CREATE ROLE themeadmin with SUPERUSER LOGIN PASSWORD 'password';

create database theme;
ALTER DATABASE theme OWNER TO themeadmin;

create database "theme-test";
ALTER DATABASE  "theme-test" OWNER TO themeadmin;

create database "theme_log";
ALTER DATABASE  "theme_log" OWNER TO themeadmin;

create database "theme_log-test";
ALTER DATABASE  "theme_log-test" OWNER TO themeadmin;
