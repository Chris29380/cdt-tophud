
window.addEventListener('message', function(event) {
    if (event.data.type == "showUi") {

        discord = event.data.discord
        databinds = event.data.databinds

		$("body").css("display","flex")
		
        loadbinds()
    }

	if (event.data.type == "hideUi") {
		
		hideUi()
    }
})

// functions binds

function loadbinds(){
    htmlBinds = `
        <div class="boxdiscord">				
            <div class="discord-text">
                ${discord}
            </div>
            <div class="discord-logo">
                <img src="img/logo.png">
            </div>
        </div>	
    `
    if (databinds && databinds.length > 0) {
        for (var i = 0; i < databinds.length; i++) {
            let label = databinds[i].label
            let key = databinds[i].key
            htmlBinds += `
                <div class="boxbind">
                    <div class="labelbind">${label}</div>            
                    <div class="keybind">${key}</div>
                </div>
            `   
        }
    }
    
    $("body .top-hud").html(htmlBinds)
}

// functions base

function hideUi() {    
    $("body").css("display", "none")
}