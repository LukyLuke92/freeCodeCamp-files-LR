import numpy as np

def calculate(list):
    if len(list) < 9:
        raise ValueError("List must contain nine numbers.")
    mat = np.array([list[0:3],list[3:6],list[6:9]])
    # means
    axis1mean = mat.mean(axis=0).tolist()
    axis2mean = mat.mean(axis=1).tolist()
    flatmean = mat.mean()
    # variances
    axis1var = mat.var(axis=0).tolist()
    axis2var = mat.var(axis=1).tolist()
    flatvar = mat.var()
    # stdev's
    axis1std = mat.std(axis=0).tolist()
    axis2std = mat.std(axis=1).tolist()
    flatstd = mat.std()
    # max's
    axis1max = mat.max(axis=0).tolist()
    axis2max = mat.max(axis=1).tolist()
    flatmax = mat.max()
    # min's
    axis1min = mat.min(axis=0).tolist()
    axis2min = mat.min(axis=1).tolist()
    flatmin = mat.min()
    # sum's
    axis1sum = mat.sum(axis=0).tolist()
    axis2sum = mat.sum(axis=1).tolist()
    flatsum = mat.sum()

    calculations = {
        'mean': [axis1mean, axis2mean, flatmean],
        'variance': [axis1var, axis2var, flatvar],
        'standard deviation': [axis1std, axis2std, flatstd],
        'max': [axis1max, axis2max, flatmax],
        'min': [axis1min, axis2min, flatmin],
        'sum': [axis1sum, axis2sum, flatsum]
    }
    print(calculations)
    return calculations