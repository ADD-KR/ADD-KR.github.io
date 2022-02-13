window.onload = async function(){
    addFrameworkCountTag(schemeJSON)
    createFrameworkList(schemeJSON)
}

function addFrameworkCountTag(json) {
    const count = json.workspace.schemes.length
    var countLabel = document.getElementById("countLabel")
    countLabel.innerText = count + "개의 프레임워크"
}

function createFrameworkList(json) {
    const count = json.workspace.schemes.length
    var list = document.getElementById("framework_list")
    for (let index = 0; index < count; index++) {
        const scheme = json.workspace.schemes[index]
        const link = "https://add-kr.github.io/" + scheme + "/documentation/" + scheme.toLowerCase()
        var item = document.createElement("li")
        item.setAttribute("class", "framework_list_item")
        item.innerHTML = `
            <a href=${link} class="framework_list_card">
                <div class="framework_list_card_body">
                    <p class="framework_list_card_title">${scheme}</p>
                </div>
                <svg aria-hidden="true" xmlns="http://www.w3.org/2000/svg" class="framework_list_card_svg" viewBox="0 0 14 25"><path data-v-7f60a732="" d="M1,24.4a.9.9,0,0,0,.7-.3L13.4,13a1,1,0,0,0,0-1.6L1.7.3A.9.9,0,0,0,1,0,.9.9,0,0,0,0,1a.9.9,0,0,0,.3.7l11,10.5L.3,22.7a.9.9,0,0,0-.3.7A.9.9,0,0,0,1,24.4Z"></path></svg>
            </a>
        `
        list.appendChild(item)
    }
}