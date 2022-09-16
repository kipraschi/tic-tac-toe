const Game = (function () {
	const NewPlayer = function (myName, myMark) {
		const name = () => myName;
		const mark = () => myMark;
		const makeMove = (index) => {
			if (!Gameboard.gameboard[index] && !isWon() && !isDraw())
				Gameboard.gameboard[index] = mark();
			else isDraw();
		};
		return {name, mark, makeMove};
	};

	const Gameboard = (function () {
		var gameboard = ["", "", "", "", "", "", "", "", ""];

		return {gameboard};
	})();

	const DisplayController = (function () {
		const _bindEvents = (tile, index) => {
			tile.addEventListener("click", () => {
				switchPlayer().makeMove(index);
				_render();
			});
		};

		const _render = function () {
			document.querySelector("ul").remove();
			const grid = document.createElement("ul");

			Gameboard.gameboard.forEach((mark, index) => {
				let tile = document.createElement("li");
				tile.textContent = `${mark}`;
				_bindEvents(tile, index);
				grid.appendChild(tile);
			});
			document.querySelector(".grid-container").appendChild(grid);
		};

		_render();
	})();

	const p1 = NewPlayer("Tim", "X");
	const p2 = NewPlayer("Bob", "0");
	let turn = 1;

	function switchPlayer() {
		if (turn % 2) currentPlayer = p1;
		else currentPlayer = p2;
		turn++;

		return currentPlayer;
	}

	function isWon() {
		let board = Gameboard.gameboard;
		return (
			(board[0] === board[1] && board[1] === board[2] && board[2] !== "") ||
			(board[3] === board[4] && board[4] === board[5] && board[5] !== "") ||
			(board[6] === board[7] && board[7] === board[8] && board[8] !== "") ||
			(board[0] === board[3] && board[3] === board[6] && board[6] !== "") ||
			(board[1] === board[4] && board[4] === board[7] && board[7] !== "") ||
			(board[2] === board[5] && board[5] === board[8] && board[8] !== "") ||
			(board[0] === board[4] && board[4] === board[8] && board[8] !== "") ||
			(board[2] === board[4] && board[4] === board[6] && board[6] !== "")
		);
	}
	function isDraw() {
		return !isWon() && Gameboard.gameboard.every((element) => element !== "");
	}
})();
