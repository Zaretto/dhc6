props.globals.initNode("controls/engines/auto-feather", 0);

var autoFeather = func {

    var auto_feather = getprop("controls/engines/auto-feather");
    var running1 = getprop("engines/engine[0]/running");
    var running2 = getprop("engines/engine[1]/running");
    var electrical_power = getprop("systems/electrical/volts");

    if (auto_feather == 1 and running1 == 0 and electrical_power>15) {
        setprop("controls/engines/engine[0]/propeller-feather",1);
	setprop("controls/engines/engine[0]/propeller-pitch",0);
    } else if(electrical_power>15) {
        setprop("controls/engines/engine[0]/propeller-feather",0);
    }

    if (auto_feather == 1 and running2 == 0 and electrical_power>15) {
        setprop("controls/engines/engine[1]/propeller-feather",1);
	setprop("controls/engines/engine[1]/propeller-pitch",0);
    } else if (electrical_power>15) {
        setprop("controls/engines/engine[1]/propeller-feather",0);
    }

    settimer(autoFeather, 0.3);
}

setlistener("/sim/signals/fdm-initialized", autoFeather);