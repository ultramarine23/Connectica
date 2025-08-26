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

const NUMBER = 0
const OPERATION = 1
const FUNCTION = 2

const PAUSE_DUR = 0.5
