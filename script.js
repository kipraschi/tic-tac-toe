const Game = (function () {

	const NewPlayer = function (myName, myMark) {
		const name = () => myName;
		const mark = () => myMark;
		const makeMove = (index) => {
			if (!Gameboard.gameboard[index]) Gameboard.gameboard[index] = mark();
		};
		return {name, mark, makeMove};
	};

	const p1 = NewPlayer("Tim", "X");
	const p2 = NewPlayer("Bob", "0");
	let turn = 1;

	const switchPlayer = function () {
		if (turn % 2 == 0) currentPlayer = p1;
		else currentPlayer = p2;
		turn++;
		return currentPlayer;
	};

	const Gameboard = (function () {
		var gameboard = ["", "", "", "", "", "", "", "", ""];
		return {gameboard};
	})();

	const DisplayController = (function (board) {
		const _bindEvents = (tile, index) => {
			tile.addEventListener("click", () => {
				switchPlayer().makeMove(index);
				_render();
			});
		};

		const _render = function () {
			document.querySelector("ul").remove();

			const grid = document.createElement("ul");

			board.forEach((mark, index) => {
				let tile = document.createElement("li");
				tile.textContent = `${mark}`;
				_bindEvents(tile, index);
				grid.appendChild(tile);
			});
			document.querySelector(".grid-container").appendChild(grid);
		};

		_render();
	})(Gameboard.gameboard);
})();
