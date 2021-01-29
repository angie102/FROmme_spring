//비동기 ajax async ES6 이상에서만 사용가능
const callApi = async(path) => {	
	console.log(path);
	let res = await fetch('ajax.jsp'+path);
	let body = await res.json();
	return body;
}


function getRandomRGB(min, max) {
	tmp = Math.ceil(min);
	temp = Math.floor(max);
	return Math.floor(Math.random() * (temp - tmp + 1)) + tmp;
}
