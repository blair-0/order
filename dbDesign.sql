SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS tb_order;
DROP TABLE IF EXISTS tb_area;
DROP TABLE IF EXISTS tb_employee;
DROP TABLE IF EXISTS tb_department;
DROP TABLE IF EXISTS tb_company;
DROP TABLE IF EXISTS tb_equipment;
DROP TABLE IF EXISTS tb_supplier;




/* Create Tables */

CREATE TABLE tb_area
(
	id smallint unsigned zerofill NOT NULL AUTO_INCREMENT,
	name varchar(128) NOT NULL,
	PRIMARY KEY (id),
	UNIQUE (id),
	UNIQUE (name)
);


CREATE TABLE tb_company
(
	id mediumint unsigned zerofill NOT NULL AUTO_INCREMENT,
	name varchar(128) NOT NULL,
	PRIMARY KEY (id),
	UNIQUE (id),
	UNIQUE (name)
);


CREATE TABLE tb_department
(
	id int unsigned zerofill NOT NULL AUTO_INCREMENT,
	name varchar(128) NOT NULL,
	-- 公司ID
	company_id mediumint unsigned zerofill NOT NULL COMMENT '公司ID',
	PRIMARY KEY (id),
	UNIQUE (id)
);


CREATE TABLE tb_employee
(
	id int unsigned zerofill NOT NULL AUTO_INCREMENT,
	name varchar(128) NOT NULL,
	-- 部门ID
	dept_id int unsigned zerofill NOT NULL COMMENT '部门ID',
	PRIMARY KEY (id),
	UNIQUE (id)
);


CREATE TABLE tb_equipment
(
	id int unsigned zerofill NOT NULL AUTO_INCREMENT,
	name varchar(256) NOT NULL,
	-- 计量单位
	unit varchar(16) COMMENT '计量单位',
	PRIMARY KEY (id),
	UNIQUE (id),
	UNIQUE (name)
);


CREATE TABLE tb_order
(
	id int unsigned zerofill NOT NULL AUTO_INCREMENT,
	-- 区域
	area_id smallint unsigned zerofill NOT NULL COMMENT '区域',
	-- 申请人ID
	applicant_id int unsigned zerofill NOT NULL COMMENT '申请人ID',
	-- 下单日期
	submit_date date NOT NULL COMMENT '下单日期',
	-- 付款日期
	pay_date date NOT NULL COMMENT '付款日期',
	-- 设备ID
	equipment_id int unsigned zerofill NOT NULL COMMENT '设备ID',
	-- 设备描述
	equipment_desc varchar(256) COMMENT '设备描述',
	-- 单价
	price decimal(19,4) unsigned NOT NULL COMMENT '单价',
	-- 数量
	quantity float unsigned NOT NULL COMMENT '数量',
	-- 费用承担公司ID
	company_id mediumint unsigned zerofill NOT NULL COMMENT '费用承担公司ID',
	-- 交财务结款状态
	-- 0：未支付
	-- 1：已支付
	payment_status tinyint unsigned NOT NULL COMMENT '交财务结款状态
0：未支付
1：已支付',
	-- 供应商ID
	supplier_id int unsigned zerofill NOT NULL COMMENT '供应商ID',
	-- 备注
	remarks varchar(256) COMMENT '备注',
	PRIMARY KEY (id),
	UNIQUE (id)
);


CREATE TABLE tb_supplier
(
	id int unsigned zerofill NOT NULL AUTO_INCREMENT,
	name varchar(128) NOT NULL,
	PRIMARY KEY (id),
	UNIQUE (id),
	UNIQUE (name)
);



/* Create Foreign Keys */

ALTER TABLE tb_order
	ADD FOREIGN KEY (area_id)
	REFERENCES tb_area (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE tb_department
	ADD FOREIGN KEY (company_id)
	REFERENCES tb_company (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE tb_order
	ADD FOREIGN KEY (company_id)
	REFERENCES tb_company (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE tb_employee
	ADD FOREIGN KEY (dept_id)
	REFERENCES tb_department (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE tb_order
	ADD FOREIGN KEY (applicant_id)
	REFERENCES tb_employee (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE tb_order
	ADD FOREIGN KEY (equipment_id)
	REFERENCES tb_equipment (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE tb_order
	ADD FOREIGN KEY (supplier_id)
	REFERENCES tb_supplier (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



