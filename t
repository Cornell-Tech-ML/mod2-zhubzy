from minitorch import *
from minitorch import *
import pytest
import numpy as np

def test_matrix_multiplication():
    # Test case 1: Basic matrix multiplication with known result
    x = tensor([[1.0, 2.0], [3.0, 4.0], [5.0, 6.0]])  # 3x2 matrix
    weights = tensor([[0.1], [0.2]])  # 2x1 matrix
    bias = tensor([0.5])  # scalar bias
    
    # Expected output calculation:
    # [1.0, 2.0] @ [[0.1], [0.2]] + 0.5 = 1.0*0.1 + 2.0*0.2 + 0.5 = 0.1 + 0.4 + 0.5 = 1.0
    # [3.0, 4.0] @ [[0.1], [0.2]] + 0.5 = 3.0*0.1 + 4.0*0.2 + 0.5 = 0.3 + 0.8 + 0.5 = 1.6
    # [5.0, 6.0] @ [[0.1], [0.2]] + 0.5 = 5.0*0.1 + 6.0*0.2 + 0.5 = 0.5 + 1.2 + 0.5 = 2.2
    expected = tensor([[1.0], [1.6], [2.2]])
    
    # Actual computation
    output = x.view(x.shape[0], x.shape[1], 1) * weights
    output = output.sum(1) + bias
    output = output.view(3,1)
    
    print(output)
    print(expected)
    # Test assertions
    assert output.shape == (3, 1), f"Expected shape (3, 1), but got {output.shape}"


test_matrix_multiplication()