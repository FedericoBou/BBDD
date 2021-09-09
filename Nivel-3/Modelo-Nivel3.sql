create database ejercicioNivel3;
use ejercicioNivel3;
CREATE TABLE IF NOT EXISTS `Nivel-3`.`Proveedores` (
  `idProveedores` INT NOT NULL AUTO_INCREMENT,
  `NombreEmpresa` VARCHAR(45) NOT NULL,
  `NombreContacto` VARCHAR(45) NOT NULL,
  `CargoContacto` VARCHAR(45) NOT NULL,
  `Dirección` VARCHAR(45) NOT NULL,
  `Ciudad` VARCHAR(45) NOT NULL,
  `Proveedorescol` VARCHAR(45) NOT NULL,
  `Teléfono` INT NOT NULL,
  `NIF` INT NOT NULL,
  PRIMARY KEY (`idProveedores`));
  
  CREATE TABLE IF NOT EXISTS `Nivel-3`.`Productos` (
  `idProductos` INT NOT NULL AUTO_INCREMENT,
  `idCategorias` INT NOT NULL,
  `idProveedores` INT NOT NULL,
  `NombreProducto` VARCHAR(45) NOT NULL,
  `Precio` DECIMAL(5,2) NOT NULL,
  `Marca` VARCHAR(45) NOT NULL,
  `GraduacionIzq` DECIMAL(5,2) NOT NULL,
  `GraduacionDer` DECIMAL(5,2) NOT NULL,
  `TipoMontura` VARCHAR(45) NOT NULL,
  `ColorCristales` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idProductos`),
  INDEX `FK_CateProduc_idx` (`idCategorias` ASC) VISIBLE,
  INDEX `FK_ProvProd_idx` (`idProveedores` ASC) VISIBLE,
  CONSTRAINT `FK_CateProduc`
    FOREIGN KEY (`idCategorias`)
    REFERENCES `Nivel-3`.`Categorias` (`idCategorias`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_ProvProd`
    FOREIGN KEY (`idProveedores`)
    REFERENCES `Nivel-3`.`Proveedores` (`idProveedores`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE TABLE IF NOT EXISTS `Nivel-3`.`Pedidos` (
  `idPedidos` INT NOT NULL AUTO_INCREMENT,
  `clientes_idClientes` INT NOT NULL,
  `Empleados_idEmpleados` INT NOT NULL,
  `fechaPedido` DATETIME NOT NULL,
  `FechaEntrega` DATETIME NOT NULL,
  PRIMARY KEY (`idPedidos`),
  INDEX `FK_PediEmplea_idx` (`Empleados_idEmpleados` ASC) VISIBLE,
  CONSTRAINT `FK_PediEmplea`
    FOREIGN KEY (`Empleados_idEmpleados`)
    REFERENCES `Nivel-3`.`Empleados` (`idEmpleados`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
    
    CREATE TABLE IF NOT EXISTS `Nivel-3`.`Empleados` (
  `idEmpleados` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Cargo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEmpleados`),
  CONSTRAINT `Fk`
    FOREIGN KEY (`idEmpleados`)
    REFERENCES `Nivel-3`.`Clientes` (`idClientes`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
    
    CREATE TABLE IF NOT EXISTS `Nivel-3`.`DetallePedido` (
  `idProducto` INT NOT NULL AUTO_INCREMENT,
  `idPedido` INT NOT NULL,
  `PrecioUnidad` DECIMAL(5,2) NOT NULL,
  `Cantidad` INT NOT NULL,
  `DetallePedido` VARCHAR(45) NULL,
  PRIMARY KEY (`idProducto`, `idPedido`),
  INDEX `FK_DetallePe_idx` (`idPedido` ASC) VISIBLE,
  CONSTRAINT `FK_ProdPedido`
    FOREIGN KEY (`idProducto`)
    REFERENCES `Nivel-3`.`Productos` (`idProductos`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_DetallePe`
    FOREIGN KEY (`idPedido`)
    REFERENCES `Nivel-3`.`Pedidos` (`idPedidos`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
    
    CREATE TABLE IF NOT EXISTS `Nivel-3`.`Clientes` (
  `idClientes` INT NOT NULL AUTO_INCREMENT,
  `dirección` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `fechaRegistro` VARCHAR(45) NOT NULL,
  `NombreContacto` VARCHAR(45) NOT NULL,
  `telefono` INT NOT NULL,
  `Ciudad` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idClientes`));
  
  CREATE TABLE IF NOT EXISTS `Nivel-3`.`Categorias` (
  `idCategorias` INT NOT NULL AUTO_INCREMENT,
  `NombreCategoria` VARCHAR(45) NOT NULL,
  `Descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCategorias`));
