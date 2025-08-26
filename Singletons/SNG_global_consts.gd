extends Node

enum Actions {
	ATTACK,
	BLOCK,
	DRAW,
}

enum ChainValues {
	ONE, TWO, THREE, FOUR, FIVE, SIX,
	ADD, SUB, MULT, DIV, EXPO, SQRT,
	SIN, COS, PERCENT
}

const BLOCK = 0
const CONNECTOR = 1
const FUNCTION = 2
