function refreshSVG(){
    document.getElementById("graph").innerHTML += "";
}


function svgGR(event) {
    const svg = document.querySelector('svg');
    const rect = svg.getBoundingClientRect();
        let r = getChe("r").eq(0).val();
        let x = ((event.clientX - rect.left - 150) * (r / 2) / (50)).toFixed(2);
        let y = (((-1) * (event.clientY - rect.top - 150)) * (r / 2) / (50)).toFixed(2);
        refreshSVG();
        sendRequest(x, y, r);

}