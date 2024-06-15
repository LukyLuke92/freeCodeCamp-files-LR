# What player will do is calculate the probability that the opponent's next move
#  will be a certain type based on what they have done in the past
# So, for example, player will look up the conditional probability that opponent
#   will play rock, given opponent's previous n moves
# Player will create and maintain a (n+1)-dimensional matrix that contains each
#   conditional probability
# For indexing, the first element (0) of the (n+1-i)th dimension will hold all values of
#   conditional probabilities given 'R' was played for the ith to last move
# For example, if n = 2, then [0][:] would contain all conditional probabilities
#   that 'R' was played on the second to last move - then [0][0][:] would contain the
#   conditional probabilities that 'R' was played for both the second to last and last move
#   - then [0][0][0] would be the probability that 'R' will be played given that 'R' was
#   played twice in a row
import numpy as np
import random as rnd

def player(prev_play, opponent_history=[]):
    if prev_play:
        opponent_history.append(prev_play)

    prob_random = 0 # chance that we will choose a random move instead of "optimal"
    ideal_move = {'R': 'P','P': 'S','S': 'R'} # this is a converter from move to winning move
    move_to_idx = {'R': 0,'P': 1,'S': 2} # this is just a converter from move to index
    idx_to_move = ['R','P','S'] # inverse of the above, don't need an object, just list
    n_moves = 4 # this is the number of moves for which conditional probabilities will be saved
    move_memory = 125 # this is the number of moves to calculate probability distributions over
    prob_mat = update_probs(prev_play,n_moves,move_memory,opponent_history)

    # If there are not enough data to calculate prob_mat, just randomly choose
    if prob_mat is None:
        guess = rnd.choice(idx_to_move)
    else:
        if rnd.random() <= prob_random:
            guess = rnd.choice(idx_to_move)
        else:
            # Get probabilities of the next move given the previous set of moves
            last_moves = opponent_history[-(n_moves-1):]
            prob_array = get_probs(last_moves, prob_mat)

            # Assign the most likely winning move to guess
            likely_move = idx_to_move[prob_array.argmax()]
            guess = ideal_move[likely_move]
    
    return guess

# Create the conditional probability matrix given the inputted args
# Note that these aren't actually probabilities, they are just counts, but
#  it doesn't seem like it is worth the effort to normalize them
def update_probs(prev_play, n_moves, move_memory, opponent_history=[]):
    prob_mat_dims = []
    for i in range(n_moves):
        prob_mat_dims.append(3)
    prob_mat = np.zeros(prob_mat_dims)
    if len(opponent_history) < n_moves:
        return None
    min_moves = min(move_memory,len(opponent_history)-n_moves+1)
    move_memory_end = len(opponent_history)-n_moves+1
    move_memory_start = len(opponent_history)-n_moves+1 - min_moves
    move_memory_range = range(move_memory_start,move_memory_end)
    for i in move_memory_range:
        find_probs(opponent_history[i:i+n_moves],prob_mat)
    return prob_mat

# This is a function that will recursively call itself until it populates
#  the highest dimension with conditional probabilities
def find_probs(cur_string, prob_mat):
    move_to_idx = {'R': 0,'P': 1,'S': 2}
    if len(cur_string) <= 1:
        if cur_string[0] == 'R':
            prob_mat[0] += 1
        elif cur_string[0] == 'P':
            prob_mat[1] += 1
        elif cur_string[0] == 'S':
            prob_mat[2] += 1
    else:
        find_probs(cur_string[1:], prob_mat[move_to_idx[cur_string[0]]])

# Another function that calls itself recursively to get the desired list
#  of counts
def get_probs(cur_string, prob_mat):
    move_to_idx = {'R': 0,'P': 1,'S': 2}
    if len(cur_string) <= 1:
        return prob_mat[move_to_idx[cur_string[0]]]
    else:
        prob_array = get_probs(cur_string[1:], prob_mat[move_to_idx[cur_string[0]]])
    return prob_array