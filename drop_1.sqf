
dropship1 sidechat "Squad Airborne";

null = [] spawn { 
    { 
        if (((assignedVehicleRole _x) select 0) =="Cargo") then { 
        removeBackpack _x; 
        _x addBackpack "B_Parachute"; 
        [_x] ordergetin false; 
        [_x] allowGetIn false; 
        unassignvehicle _x; 
        moveout _x; 
        sleep 0.3; 
        }; 
    } forEach (crew dropship1); 
}; 