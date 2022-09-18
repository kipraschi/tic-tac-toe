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
		const _bindEvents = {
			start: () => {
                const button = document.querySelector(".start");
                button.addEventListener("click", () => {
                    start(document.querySelector("#nameX").value, 
                    document.querySelector("#name0").value);
                    _render();
                });
            },
			tiles: (tile, index) =>
				tile.addEventListener("click", () => {
					switchPlayer().makeMove(index);
					_render();
				}),
		};

		const _render = function () {
			document.querySelector(".grid").remove();
			const grid = document.createElement("div");
			grid.classList.add("grid");

			Gameboard.gameboard.forEach((playerMark, index) => {
				let tile = document.createElement("div");
				tile.classList.add("tile");
				_bindEvents.tiles(tile, index);
				let mark = document.createElement("p");
				mark.textContent = `${playerMark}`;
				tile.appendChild(mark);
				grid.appendChild(tile);
			});
			document.querySelector(".grid-container").appendChild(grid);
		};

        _bindEvents.start();
	})();

	const p1 = NewPlayer("Name X", "X");
	const p2 = NewPlayer("Name 0", "0");
	let turn = 1;

    function start(nameX, name0) {
        //initialise game:
        //turn set to 1
        //names are no longer fields but divs
        console.log(`${nameX} plays with X`);
        console.log(`${name0} plays with 0`);
    }

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
