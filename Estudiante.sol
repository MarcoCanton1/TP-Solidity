PDX-License-Identifier: MIT
pragma solidity ^0.8.10;
 
contract Estudiante{
    
    string private _nombre;
    string private _apellido;
    string private _curso;
    address private _docente; // es address debido a que es el que lo envia
    string[] private _cantidad_materias;
    
    mapping(uint8 => mapping(string => uint8)) private bimestre; //creamos un mapping para el otro mapping y de esta forma guardar las mateias con sus respectivas notas dentro de cada bimestre dentro del mapping
    mapping(string => uint8) private notas_materias; // elegimos uint8 debido a que almacena mas de 100 valores
 
    // asignamos las variables iniciales
    constructor(string memory nombre_, string memory apellido_, string memory curso_){
        _nombre = nombre_;
        _apellido = apellido_;
        _curso = curso_;
        _docente = msg.sender;
    }
 
    function apellido() public view returns (string memory){
        return _apellido; // devuelve el apellido del estudiante
    }
 
    function nombre_completo() public view returns (string memory){
        return string(bytes.concat(bytes(_nombre), " ", bytes(_apellido))); // convierte los 2 strings en bytes, los une y los vuelve a convertir en string
    }
 
    function curso() public view returns (string memory){
        return _curso; // devuelve el curso
    }
 
    // el docente establece la nota de cada materia
    function set_nota_materia(uint8 nota, string memory materia, uint8 bimsetre_) public {
        require(msg.sender == _docente, "Solo el docente puede poner notas"); // revisa que el que mande la nota sea el docente registrado y sino devuelve un mensaje de error
        notas_materias[materia] = nota; // guarda en el array el valor (nota) de la key insertada (materia)
        _cantidad_materias.push(materia);
        if (notas_materias[materia] == 0){
            
        }
        else{
             // requiere que la nota de la materia no sea 0
        }
    }
 
 
    function nota_materia(string memory materia) public view returns (uint){
        return notas_materias[materia]; // pide del array notas_materias el valor de la key materia (la nota de la materia pedida)
    }
 
    function aprobo(string memory materia) public view returns (bool){
        if(notas_materias[materia] >= 60) //si la nota de la materia especificada es mayor o igual a 60 devuelve true que significa que aprobo
        {
            return true;
        }
        else //en caso de que la nota sea menor a 60 devuelve false, indicando que reprobo
        {
            return false;
        }
    }

    function promedio() public view returns (uint){
        uint total = 0;
        uint cantidad_de_materias = _cantidad_materias.length;
        for (uint i = 0; i < cantidad_de_materias; i++){
            total += notas_materias[_cantidad_materias[i]];
        }
        return total / cantidad_de_materias;
    }
}
