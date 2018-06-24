-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Tipo Producto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Tipo Producto` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Tipo Producto` (
  `idTipo` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idTipo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Productos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Productos` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Productos` (
  `idProductos` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(200) NOT NULL,
  `precio` DECIMAL(5) NOT NULL,
  `idTipoProducto` INT NULL,
  `Tipo Producto_idTipo` INT NOT NULL,
  PRIMARY KEY (`idProductos`, `Tipo Producto_idTipo`),
  INDEX `fk_Productos_Tipo Producto_idx` (`Tipo Producto_idTipo` ASC),
  CONSTRAINT `fk_Productos_Tipo Producto`
    FOREIGN KEY (`Tipo Producto_idTipo`)
    REFERENCES `mydb`.`Tipo Producto` (`idTipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Cliente` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `cedula` VARCHAR(10) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(100) NULL,
  `telefono` VARCHAR(10) NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Facturas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Facturas` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Facturas` (
  `idFacturas` INT NOT NULL AUTO_INCREMENT,
  `numeroFactura` VARCHAR(15) NOT NULL,
  `fechaFactura` DATETIME NOT NULL,
  `iva` DECIMAL(5) NOT NULL,
  `total` DECIMAL(5) NOT NULL,
  `Cliente_idCliente` INT NOT NULL,
  PRIMARY KEY (`idFacturas`, `Cliente_idCliente`),
  INDEX `fk_Facturas_Cliente1_idx` (`Cliente_idCliente` ASC),
  CONSTRAINT `fk_Facturas_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `mydb`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Detalles Factura`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Detalles Factura` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Detalles Factura` (
  `idDetalles` INT NOT NULL AUTO_INCREMENT,
  `cantidad` INT NOT NULL,
  `precio` DECIMAL(5) NOT NULL,
  `total` DECIMAL(5) NOT NULL,
  `Productos_idProductos` INT NOT NULL,
  `Productos_Tipo Producto_idTipo` INT NOT NULL,
  `Facturas_idFacturas` INT NOT NULL,
  `Facturas_Cliente_idCliente` INT NOT NULL,
  PRIMARY KEY (`idDetalles`, `Productos_idProductos`, `Productos_Tipo Producto_idTipo`, `Facturas_idFacturas`, `Facturas_Cliente_idCliente`),
  INDEX `fk_Detalles_Productos1_idx` (`Productos_idProductos` ASC, `Productos_Tipo Producto_idTipo` ASC),
  INDEX `fk_Detalles_Facturas1_idx` (`Facturas_idFacturas` ASC, `Facturas_Cliente_idCliente` ASC),
  CONSTRAINT `fk_Detalles_Productos1`
    FOREIGN KEY (`Productos_idProductos` , `Productos_Tipo Producto_idTipo`)
    REFERENCES `mydb`.`Productos` (`idProductos` , `Tipo Producto_idTipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Detalles_Facturas1`
    FOREIGN KEY (`Facturas_idFacturas` , `Facturas_Cliente_idCliente`)
    REFERENCES `mydb`.`Facturas` (`idFacturas` , `Cliente_idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Proveedor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Proveedor` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Proveedor` (
  `idProveedor` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `direccion` VARCHAR(100) NOT NULL,
  `contacto` VARCHAR(300) NOT NULL,
  PRIMARY KEY (`idProveedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Inventario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Inventario` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Inventario` (
  `idInventario` INT NOT NULL AUTO_INCREMENT,
  `cantidad` VARCHAR(45) NOT NULL,
  `Proveedor_idProveedor` INT NOT NULL,
  `Facturas_idFacturas` INT NOT NULL,
  `Facturas_Cliente_idCliente` INT NOT NULL,
  `Detalles_idDetalles` INT NOT NULL,
  `Detalles_Productos_idProductos` INT NOT NULL,
  `Detalles_Productos_Tipo Producto_idTipo` INT NOT NULL,
  `Detalles_Facturas_idFacturas` INT NOT NULL,
  `Detalles_Facturas_Cliente_idCliente` INT NOT NULL,
  PRIMARY KEY (`idInventario`, `Proveedor_idProveedor`, `Facturas_idFacturas`, `Facturas_Cliente_idCliente`, `Detalles_idDetalles`, `Detalles_Productos_idProductos`, `Detalles_Productos_Tipo Producto_idTipo`, `Detalles_Facturas_idFacturas`, `Detalles_Facturas_Cliente_idCliente`),
  INDEX `fk_Inventario_Proveedor1_idx` (`Proveedor_idProveedor` ASC),
  INDEX `fk_Inventario_Detalles1_idx` (`Detalles_idDetalles` ASC, `Detalles_Productos_idProductos` ASC, `Detalles_Productos_Tipo Producto_idTipo` ASC, `Detalles_Facturas_idFacturas` ASC, `Detalles_Facturas_Cliente_idCliente` ASC),
  CONSTRAINT `fk_Inventario_Proveedor1`
    FOREIGN KEY (`Proveedor_idProveedor`)
    REFERENCES `mydb`.`Proveedor` (`idProveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Inventario_Detalles1`
    FOREIGN KEY (`Detalles_idDetalles` , `Detalles_Productos_idProductos` , `Detalles_Productos_Tipo Producto_idTipo` , `Detalles_Facturas_idFacturas` , `Detalles_Facturas_Cliente_idCliente`)
    REFERENCES `mydb`.`Detalles Factura` (`idDetalles` , `Productos_idProductos` , `Productos_Tipo Producto_idTipo` , `Facturas_idFacturas` , `Facturas_Cliente_idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Sucursal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Sucursal` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Sucursal` (
  `idSucursal` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(100) NOT NULL,
  `ubicacion` VARCHAR(100) NOT NULL,
  `contacto` VARCHAR(100) NOT NULL,
  `Inventario_idInventario` INT NOT NULL,
  `Inventario_Proveedor_idProveedor` INT NOT NULL,
  `Inventario_Facturas_idFacturas` INT NOT NULL,
  `Inventario_Facturas_Cliente_idCliente` INT NOT NULL,
  PRIMARY KEY (`idSucursal`, `Inventario_idInventario`, `Inventario_Proveedor_idProveedor`, `Inventario_Facturas_idFacturas`, `Inventario_Facturas_Cliente_idCliente`),
  INDEX `fk_Sucursal_Inventario1_idx` (`Inventario_idInventario` ASC, `Inventario_Proveedor_idProveedor` ASC, `Inventario_Facturas_idFacturas` ASC, `Inventario_Facturas_Cliente_idCliente` ASC),
  CONSTRAINT `fk_Sucursal_Inventario1`
    FOREIGN KEY (`Inventario_idInventario` , `Inventario_Proveedor_idProveedor` , `Inventario_Facturas_idFacturas` , `Inventario_Facturas_Cliente_idCliente`)
    REFERENCES `mydb`.`Inventario` (`idInventario` , `Proveedor_idProveedor` , `Facturas_idFacturas` , `Facturas_Cliente_idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
