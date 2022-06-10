// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;
 
contract Estudiante{
   
    string private _nombre;
    string private _apellido;
    string private _curso;
    address private _docente; // es address debido a que es el que lo envia
 
    mapping(string => uint8) private notas_materias; // elegimos uint8 debido a que almacena mas de 100 valores
 
    // asignamos las variables iniciales
    constructor(string memory nombre_, string memory apellido_, string memory curso_){
        _nombre = nombre_;
        _apellido = apellido_
        _curso = curso_;
        _docente = msg.sender;
    }
 
    function apellido() public view returns (string memory){
        return _apellido;
    }
 
    function nombre_completo() public view returns (string memory){
        return string(bytes.concat(bytes(_nombre), " ", bytes(_apellido)));
    }
 
    function curso() public view returns (string memory){
        return _curso;
    }
}