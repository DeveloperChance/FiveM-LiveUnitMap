CREATE DATABASE FiveM_UnitHandler;

CREATE TABLE FiveM_UnitHandler.unit_data (
    steam_hex VARCHAR(64),
    unit_id VARCHAR(4),
    unit_type VARCHAR(4)
);

ALTER TABLE FiveM_UnitHandler.unit_data
CHANGE COLUMN steam_hex steam_hex VARCHAR(64) NOT NULL ,
CHANGE COLUMN unit_id unit_id VARCHAR(4) NOT NULL DEFAULT '000' ,
CHANGE COLUMN unit_type unit_type VARCHAR(4) NOT NULL DEFAULT 'leo' ,
ADD UNIQUE INDEX steam_hex_UNIQUE (steam_hex ASC),
ADD PRIMARY KEY (steam_hex);
;