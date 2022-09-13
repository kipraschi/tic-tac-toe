// const game = (function () {

const PlayerFactory = function (myName, myMark) {
	const name = () => myName;
	const mark = () => myMark;
	return {name, mark};
};

const p1 = PlayerFactory("Tim", "X");
const p2 = PlayerFactory("Bob", "0");

const gameBoard = (function () {
	const _render = function () {};
})();

const displayController = (function () {})();

// })();
