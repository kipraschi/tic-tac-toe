// const Game = (function () {
const NewPlayer = function (myName, myMark) {
	const name = () => myName;
	const mark = () => myMark;
	const makeMove = (index) => {
       gameBoard.gameboard[index] = mark();
       displayController.render();
    };
	return {name, mark, makeMove};
};

const p1 = NewPlayer("Tim", "X");
const p2 = NewPlayer("Bob", "0");

const gameBoard = (function () {
	var gameboard = ["X", "0", "X", "X", "X", "0", "0", "X", "0"];
	return {gameboard};
})();

const displayController = (function (board) {
	const render = () => {
        document.querySelector("ul").remove();
		const grid = document.createElement("ul");
		board.forEach((mark) => {
            let box = document.createElement("li");
            box.textContent = `${mark}`;
			grid.appendChild(box);
		});
        document.querySelector(".grid-container").appendChild(grid);
	};
	const bindEvents = () => {};

    return {render};

})(gameBoard.gameboard);

// })();
