if (isServer) then {
    //this code will run only once on the server PC
	execVM "server\init.sqf";
} else {
    //this code will run on every joining client
	execVM "client\init.sqf";
};