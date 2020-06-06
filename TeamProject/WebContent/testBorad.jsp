<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <title>bootstrap4</title>
    <style>
    @import 'https://fonts.googleapis.com/css?family=Lato';
/*   Variables   */
/*   End of Variables   */
* {
  padding: 0;
  margin: 0;
}

html {
  box-sizing: border-box;
}

* {
  text-rendering: optimizeLegibility;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

html, body {
  width: 100%;
  height: 100%;
  font-family: "Lato", sans-serif;
}

*, *:before, *:after {
  box-sizing: inherit;
}

/*  End Resets  */
.container {
  background-color: pink;
  width: 100%;
  height: 100%;
  display: -webkit-box;
  display: flex;
  -webkit-box-pack: center;
          justify-content: center;
  -webkit-box-align: center;
          align-items: center;
}

.box {
  width: 1100px;
  height: 900px;
  background-color: white;
  display: -webkit-box;
  display: flex;
  -webkit-box-orient: horizontal;
  -webkit-box-direction: normal;
          flex-flow: row nowrap;
}

.left-bar {
  position: relative;
  z-index: 5;
  width: 80px;
  height: 100%;
  background: #FF4E50;
  background: -webkit-gradient(linear, left top, left bottom, from(#FF2C55), to(#FF4E2D));
  background: linear-gradient(180deg, #FF2C55, #FF4E2D);
  display: -webkit-box;
  display: flex;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
          flex-direction: column;
  -webkit-box-align: center;
          align-items: center;
}
.left-bar span {
  padding: 5px;
}
.left-bar > span {
  cursor: pointer;
  -webkit-transform: scale(1, 1);
          transform: scale(1, 1);
  -webkit-transition: all ease-in-out 150ms;
  transition: all ease-in-out 150ms;
}
.left-bar > span:hover {
  -webkit-transform: scale(1.2, 1.2);
          transform: scale(1.2, 1.2);
}
.left-bar > span:first-child {
  margin-top: 20px;
  color: white;
  font-size: 26px;
}
.left-bar > span:last-child {
  color: rgba(255, 255, 255, 0.7);
  margin-top: 500px;
  font-size: 20px;
}

.menu-group {
  height: 200px;
  display: -webkit-box;
  display: flex;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
          flex-direction: column;
  -webkit-box-align: center;
          align-items: center;
  -webkit-box-pack: justify;
          justify-content: space-between;
  margin-top: 70px;
}
.menu-group > span {
  color: rgba(255, 255, 255, 0.5);
  cursor: pointer;
  -webkit-transform: scale(1);
          transform: scale(1);
  -webkit-transition: all ease-in-out 150ms;
  transition: all ease-in-out 150ms;
}
.menu-group > span:hover {
  -webkit-transform: scale(1.2, 1.2);
          transform: scale(1.2, 1.2);
}
.menu-group .active {
  color: white;
}
.menu-group .active:after {
  content: "";
  position: absolute;
  margin-left: 3px;
  margin-top: -4px;
  padding: 4px;
  background-color: yellow;
  border-radius: 50%;
  box-shadow: 0 0 5px 2px rgba(255, 255, 0, 0.5);
}

.building {
  font-size: 14px;
  display: -webkit-box;
  display: flex;
  color: rgba(255, 255, 255, 0.5);
  -webkit-transform: scale(1);
          transform: scale(1);
  -webkit-transition: all ease-in-out 150ms;
  transition: all ease-in-out 150ms;
  cursor: pointer;
  padding: 5px;
}
.building:hover {
  -webkit-transform: scale(1.2, 1.2);
          transform: scale(1.2, 1.2);
}
.building > span {
  padding: 0;
}
.building > span:nth-child(1) {
  font-size: 10px;
  align-self: flex-end;
}
.building.active:after {
  content: "";
  position: absolute;
  margin-left: 22px;
  margin-top: -4px;
  padding: 4px;
  background-color: yellow;
  border-radius: 50%;
  box-shadow: 0 0 5px 2px rgba(255, 255, 0, 0.5);
}

.wrapper {
  -webkit-box-flex: 1;
          flex: 1;
}

.top-bar {
  position: relative;
  display: -webkit-box;
  display: flex;
  height: 60px;
  -webkit-box-align: center;
          align-items: center;
  border-bottom: 1px solid rgba(0, 0, 0, 0.05);
  box-shadow: 0px 3px 5px rgba(0, 0, 0, 0.08);
}
.top-bar > span {
  margin-left: 30px;
  font-weight: bold;
  letter-spacing: 2px;
  color: #FF2C55;
}

.cta-button {
  cursor: pointer;
  position: absolute;
  bottom: -45%;
  right: 3.5%;
  width: 50px;
  height: 50px;
  background-color: #FF2C55;
  border-radius: 50%;
  display: -webkit-box;
  display: flex;
  -webkit-box-pack: center;
          justify-content: center;
  -webkit-box-align: center;
          align-items: center;
  box-shadow: 0 0 4px rgba(0, 0, 0, 0.14), 0 4px 8px rgba(0, 0, 0, 0.28);
  -webkit-transition: all ease-in-out 150ms;
  transition: all ease-in-out 150ms;
}
.cta-button:hover {
  box-shadow: 0 6px 12px rgba(0, 0, 0, 0.46);
  -webkit-transform: translateY(-5px);
          transform: translateY(-5px);
}
.cta-button > span {
  color: white;
  font-size: 30px;
}

.menu {
  height: 50px;
  display: -webkit-box;
  display: flex;
  -webkit-box-align: center;
          align-items: center;
  -webkit-box-pack: justify;
          justify-content: space-between;
  margin-top: 45px;
}
.menu span {
  color: #FF2C55;
}
.menu span:nth-child(n+2) {
  cursor: pointer;
}

.search {
  margin-left: 30px;
}
.search input {
  margin-left: 15px;
  border: none;
}

.list-info {
  margin-right: 30px;
}
.list-info span:nth-child(1) {
  margin-right: 40px;
}
.list-info span:nth-child(2) {
  margin-right: 20px;
}

.grid {
  display: -webkit-box;
  display: flex;
  flex-wrap: wrap;
  -webkit-box-pack: justify;
          justify-content: space-between;
  padding-left: 25px;
  padding-right: 25px;
}

.card {
  position: relative;
  display: -webkit-box;
  display: flex;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
          flex-direction: column;
  -webkit-box-pack: center;
          justify-content: center;
  -webkit-box-align: center;
          align-items: center;
  border-radius: 3px;
  width: 21%;
  height: 195px;
  margin: 15px 0 30px;
  box-shadow: 0 2px 15px 0px rgba(0, 0, 0, 0.2);
}
.card:hover .overlay {
  opacity: 1;
}

.number {
  z-index: 6;
  position: absolute;
  top: 10px;
  left: 10px;
  display: -webkit-box;
  display: flex;
  background-color: #FF2C55;
  width: 30px;
  height: 30px;
  border-radius: 50%;
  -webkit-box-align: center;
          align-items: center;
  -webkit-box-pack: center;
          justify-content: center;
  box-shadow: 0 3px 7px 1px rgba(255, 44, 85, 0.5);
}
.number > span {
  color: white;
  font-weight: bold;
}

.overlay {
  opacity: 0;
  background: #FF4E50;
  background: -webkit-gradient(linear, left top, right top, from(rgba(255, 44, 85, 0.7)), to(rgba(255, 78, 45, 0.7)));
  background: linear-gradient(90deg, rgba(255, 44, 85, 0.7), rgba(255, 78, 45, 0.7));
  width: 100%;
  height: 100%;
  border-radius: 3px;
  position: absolute;
  top: 0;
  left: 0;
  -webkit-transition: all ease-in-out 200ms;
  transition: all ease-in-out 200ms;
  display: -webkit-box;
  display: flex;
  -webkit-box-pack: center;
          justify-content: center;
  -webkit-box-align: center;
          align-items: center;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
          flex-direction: column;
  flex-wrap: wrap;
}

.img {
  background-color: pink;
  height: 50%;
  width: 80%;
  display: -webkit-box;
  display: flex;
  -webkit-box-pack: center;
          justify-content: center;
  -webkit-box-align: center;
          align-items: center;
}
.img img {
  width: 160px;
  height: 130px;
}

.product-name {
  font-family: "Lato", sans-serif;
  font-weight: bold;
  color: #FF2C55;
  margin-top: 10px;
}

.detail > span {
  cursor: pointer;
}
.detail > span:nth-child(1) {
  width: 80%;
  height: 20px;
  background-color: transparent;
  padding: 10px 40px;
  border-radius: 50px;
  border: 3px solid white;
  color: white;
}
.detail > span:nth-child(2) {
  color: white;
  position: absolute;
  top: 15px;
  right: 15px;
  font-size: 19px;
}
    </style>
  </head>
  <body>
    
<div class="container">
  <div class="box">
    <div class="left-bar"><span class="fa fa-cloud-download"></span>
      <div class="menu-group">    <span class="fa fa-television"></span><span class="fa fa-shopping-cart active"></span>
        <div class="building"><span class="fa fa-building"></span><span class="fa fa-building"></span></div><span class="fa fa-cog"></span>
      </div><span class="fa fa-sign-out"></span>
    </div>
    <div class="wrapper">   
      <div class="top-bar"><span class="cloud">rkddn</span>
        <div class="cta-button"><span>+</span></div>
      </div>
      <div class="content">
        <div class="menu">
          <div class="search">
            <label> <span class="fa fa-search"></span></label>
            <input placeholder="Search Items"/>
          </div>
          <div class="list-info"><span>29 Items</span><span class="fa fa-bars"></span><span class="fa fa-th-large"></span></div>
        </div>
      </div>
      <div class="grid"> 
        <div class="card">
          <div class="number"><span>1</span></div>
          <div class="img"></div>
          <div class="product-name"><span>강원도 ㅋ</span></div>
          <div class="overlay">
            <div class="detail"><span>Details</span><span class="fa fa-pencil"></span></div>
          </div>
        </div>
        <div class="card">
          <div class="number"><span>2</span></div>
          <div class="img"></div>
          <div class="product-name"><span>Nike T-Shirt Black</span></div>
          <div class="overlay">
            <div class="detail"><span>Details</span><span class="fa fa-pencil"></span></div>
          </div>
        </div>
        <div class="card">
          <div class="number"><span>3</span></div>
          <div class="img"></div>
          <div class="product-name"><span>Air Nike Tenis</span></div>
          <div class="overlay">
            <div class="detail"><span>Details</span><span class="fa fa-pencil"></span></div>
          </div>
        </div>
        <div class="card">
          <div class="number"><span>4</span></div>
          <div class="img"></div>
          <div class="product-name"><span>Air Nike Tenis</span></div>
          <div class="overlay">
            <div class="detail"><span>Details</span><span class="fa fa-pencil"></span></div>
          </div>
        </div>
        <div class="card">
          <div class="number"><span>5</span></div>
          <div class="img"></div>
          <div class="product-name"><span>Air Nike Tenis</span></div>
          <div class="overlay">
            <div class="detail"><span>Details</span><span class="fa fa-pencil"></span></div>
          </div>
        </div>
        <div class="card">
          <div class="number"><span>6</span></div>
          <div class="img"></div>
          <div class="product-name"><span>Air Nike Tenis</span></div>
          <div class="overlay">
            <div class="detail"><span>Details</span><span class="fa fa-pencil"></span></div>
          </div>
        </div>
        <div class="card">
          <div class="number"><span>7</span></div>
          <div class="img"></div>
          <div class="product-name"><span>Air Nike Tenis</span></div>
          <div class="overlay">
            <div class="detail"><span>Details</span><span class="fa fa-pencil"></span></div>
          </div>
        </div>
        <div class="card">
          <div class="number"><span>8</span></div>
          <div class="img"></div>
          <div class="product-name"><span>Air Nike Tenis</span></div>
          <div class="overlay">
            <div class="detail"><span>Details</span><span class="fa fa-pencil"></span></div>
          </div>
        </div>
        <div class="card">
          <div class="number"><span>9</span></div>
          <div class="img"></div>
          <div class="product-name"><span>Air Nike Tenis</span></div>
          <div class="overlay">
            <div class="detail"><span>Details</span><span class="fa fa-pencil"></span></div>
          </div>
        </div>
        <div class="card">
          <div class="number"><span>10</span></div>
          <div class="img"></div>
          <div class="product-name"><span>Air Nike Tenis</span></div>
          <div class="overlay">
            <div class="detail"><span>Details</span><span class="fa fa-pencil"></span></div>
          </div>
        </div>
        <div class="card">
          <div class="number"><span>11</span></div>
          <div class="img"></div>
          <div class="product-name"><span>Air Nike Tenis</span></div>
          <div class="overlay">
            <div class="detail"><span>Details</span><span class="fa fa-pencil"></span></div>
          </div>
        </div>
        <div class="card">
          <div class="number"><span>12</span></div>
          <div class="img"></div>
          <div class="product-name"><span>Air Nike Tenis</span></div>
          <div class="overlay">
            <div class="detail"><span>Details</span><span class="fa fa-pencil"></span></div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
  </body>
</html>
