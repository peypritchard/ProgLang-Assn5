/*
 cracker.pro by Peyton Pritchard for Programming Languages w/ Prof. Tarau
*/

%  performs, if possible, a move
% given the current occupancy of the cells
% from,over,to : describes moves and their opposites
move(From, 1, To) :-
  member([From,To], [[0,3], [3,0]]).
move(From, 2, To) :-
  member([From,To], [[0,5], [5,0]]).
move(From, 3, To) :-
  member([From,To], [[1,6], [6,1]]).
move(From, 4, To) :-
  member([From,To], [[1,8], [8,1]]).
move(From, 4, To) :-
  member([From,To], [[2,7], [7,2]]).
move(From, 4, To) :-
  member([From,To], [[3,5], [5,3]]).
move(From, 5, To) :-
  member([From,To], [[2,9], [9,2]]).
move(From, 6, To) :-
  member([From,To], [[3,10], [10,3]]).
move(From, 7, To) :-
  member([From,To], [[3,12], [12,3], [4,11], [11,4], [6,8], [8,6]]).
move(From, 8, To) :-
  member([From,To], [[4,13], [13,4]]).
move(From, 8, To) :-
  member([From,To], [[5,12], [12,5]]).
move(From, 8, To) :-
  member([From,To], [[7,9], [9,7]]).
move(From, 9, To) :-
  member([From,To], [[5,14], [14,5]]).
move(From, 11, To) :-
  member([From,To], [[10,12], [12,10]]).
move(From, 12, To) :-
  member([From,To], [[11,13], [13,11]]).
move(From, 13, To) :-
  member([From,To], [[12,14], [14,12]]).

% generator for moves
step(Open1, Taken1, M, Moves) :-
  select(From, Taken1, Taken2),
  select(Over, Taken2, Taken3), % Look at future moves
  select(To, Open1, Open2),
  move(From, Over, To),
  step([From, Over|Open2], [To|Taken3], [move(From, Over, To) | M], Moves).

step(_, [_], M, Moves) :-
  reverse(M, Moves).
  

% generator that yields all possible solutions
% given a cell configuration
% (in the given Python program, this is akin to solve(kd).)
go(Moves) :-
  step([0], [1,2,3,4,5,6,7,8,9,10,11,12,13,14], [], Moves).


% shows the result by printing out successive states
  

% replay a sequence of moves, showing the state of cells  


% prints out a terse view of solutions for each missing peg
show(Kd) :-
  print(Kd).

% visualizes a solution for each first 5 positions
% others look the same after 120 degrees rotations
go() :-
  go(Moves),
  show(Moves).

