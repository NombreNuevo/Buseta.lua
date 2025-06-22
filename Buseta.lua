local DIAS_SEMANA = 6
local nombres = {}
local horas_trabajadas = {}
local sueldo_hora = {}
local total_horas_semana = {}
local sueldo_semanal = {}

local function leerNumero(mensaje)
    while true do
        print(mensaje)
        local entrada = io.read()
        local numero = tonumber(entrada)
        if numero then
            return numero
        else
            print("Error: Introduzca un valor correcto (número)")
        end
    end
end


local function leerNumeroEntero(mensaje)
    while true do
        print(mensaje)
        local entrada = io.read()
        local numero = tonumber(entrada)
        if numero then
            return math.floor(numero)
        else
            print("Error: Introduzca un valor correcto (número entero)")
        end
    end
end

local function leerSiNo(mensaje)
    while true do
        print(mensaje)
        local respuesta = io.read():lower()
        if respuesta == "si" or respuesta == "no" then
            return respuesta
        else
            print("Error: Por favor ingrese si o no")
        end
    end
end

titulo = [[ 
  ___              _          _           
 | _ )_  _ ___ ___| |_ __ _  | |_  _ __ _ 
 | _ \ || (_-</ -_)  _/ _` |_| | || / _` |
 |___/\_,_/__/\___|\__\__,_(_)_|\_,_\__,_|
                                          
]]


print(titulo)
print("")
print("~~por Gabriel Ramos~~")
print("")
print("~*:._.:*~*:._.:*~*:._.:*~*:")

for i = 1, 5 do
    print("Ingrese nombre del chofer " .. i .. ": ")
    nombres[i] = io.read()
    
    sueldo_hora[i] = leerNumero("Ingrese sueldo por hora para " .. nombres[i] .. ": ")
    
    horas_trabajadas[i] = {}
    
    local respuesta = leerSiNo("¿El chofer "..nombres[i].." trabajó las mismas horas todos los días? (si/no): ")
    
    if respuesta == "si" then
        local horas = leerNumeroEntero("Ingrese las horas trabajadas cada día (entero, se descartarán minutos): ")
        
        
        for j = 1, DIAS_SEMANA do
            horas_trabajadas[i][j] = horas
        end
    else
        
        for j = 1, DIAS_SEMANA do
            local dia
            if j == 1 then dia = "Lunes"
            elseif j == 2 then dia = "Martes"
            elseif j == 3 then dia = "Miércoles"
            elseif j == 4 then dia = "Jueves"
            elseif j == 5 then dia = "Viernes"
            else dia = "Sábado" end
            
            horas_trabajadas[i][j] = leerNumeroEntero("Ingrese horas trabajadas el "..dia.." para "..nombres[i].." (entero): ")
        end
    end
end

local total_empresa = 0
local max_lunes = 0
local nombre_max_lunes = ""

for i = 1, 5 do
    local total_horas = 0
    for j = 1, DIAS_SEMANA do
        total_horas = total_horas + horas_trabajadas[i][j]
        
        if j == 1 then
            if horas_trabajadas[i][j] > max_lunes then
                max_lunes = horas_trabajadas[i][j]
                nombre_max_lunes = nombres[i]
            end
        end
    end
    total_horas_semana[i] = total_horas
    sueldo_semanal[i] = total_horas * sueldo_hora[i]
    total_empresa = total_empresa + sueldo_semanal[i]
end

print("~REPORTE SEMANAL DE CHOFERES!!!")
print("============================")
print("")

for i = 1, 5 do
    print("Chofer: " .. nombres[i])
    print("Total horas semana: " .. total_horas_semana[i])
    print("Sueldo semanal: $" .. sueldo_semanal[i])
    print("------------------------------------")
end

print("")
print("TOTAL A PAGAR POR LA EMPRESA: $" .. total_empresa)
print("")
print("El chofer que trabajó más horas el lunes fue: " .. nombre_max_lunes .. " con " .. max_lunes .. " horas.")
