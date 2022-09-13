// const game = (function () {

const NewPlayer = function (myName, myMark) {
	const name = () => myName;
	const mark = () => myMark;
	return {name, mark};
};

const p1 = NewPlayer("Tim", "X");
const p2 = NewPlayer("Bob", "0");

const gameBoard = (function () {
    var gameboard = [];
    return {gameboard}
})();

const displayController = (function () {
	const _render = () => {};
    const _bindEvents = () => {};
})();

// })();
