# Module 9: Simulation of Wave Propagation using Neural Networks

## Overview

Module 8 utilizes a Physics-Informed Neural Network (PINN) to model seismic wave propagation within Mars' interior. The network is trained using seismic data, with physics-based constraints enforced via the wave propagation equations. This approach incorporates both traditional neural network capabilities and physical principles of seismic wave behavior, such as P-wave and S-wave equations, to predict velocity profiles in Mars' crust and mantle.

## Tech Stack

| Technology     | Purpose                     | Where & Why Used                           |
| -------------- | --------------------------- | ------------------------------------------ |
| **Python**     | General-purpose programming | Entire module                              |
| **Numpy**      | Numerical computations      | - Handling matrix operations               |
| **Torch**      | Deep learning framework     | - Building and training the neural network |
| **Matplotlib** | Data visualization          | - Plotting results for evaluation          |
| **Pandas**     | Data handling               | - Preprocessing seismic data               |

## Problem Statement and Approach

### Problem Statement:

Mars seismic data, derived from waveforms, contains valuable insights into its interior structure. However, traditional methods for modeling seismic waves are not always accurate. This module integrates the power of deep learning with physics constraints to predict the velocity profiles of Mars' crust and mantle more reliably

### Approach to Solve the Problem:

1. **Data Preprocessing**: Clean and standardize the seismic data, particularly the radius and seismic velocities (P-wave and S-wave).
2. **Physics-Informed Neural Network (PINN)**: A neural network is constructed to predict velocities (vpv, vph, vsv, vsh) based on the input radius. The network incorporates the wave equation residuals as a loss function to ensure predictions are consistent with seismic physics.
3. **Training**: The PINN is trained using the data and the physics-based residuals to predict Mars' interior seismic velocity profile, ensuring the results adhere to the physical principles of wave propagation.
4. **Evaluation**: Visualize the network's predictions and compare them to expected results.

## Functionality and Workflow

### Step 1: Loading and Preprocessing Data

**Function**: load_and_preprocess_data(file_path)
**Process**:

- Load seismic data from a CSV file.
- Normalize relevant numerical columns by standardizing each feature.
- Prepare the data for input into the neural network.

### Step 2: Building the Physics-Informed Neural Network

**Class**: ImprovedMarsSeismicPINN
**Process**:

- The network consists of fully connected layers, initialized with Xavier uniform initialization for the weights.
- Tanh activation functions are used throughout the network, except for the output layer.
- The network outputs predicted values for the seismic velocities (P-wave and S-wave velocities) based on the input radius.

### Step 3: Calculating Wave Equation Residuals

**Function**: compute_wave_equation_residual(model, x)
**Process**:

- Use automatic differentiation to compute the first and second derivatives of the predicted velocities (vpv, vph, vsv, vsh) with respect to the input radius.
- Calculate the residuals for both the P-wave and S-wave equations.
- These residuals are used to enforce the physics-informed loss function, which ensures the predictions follow the wave propagation physics.

### Step 4: Training the PINN

**Process**:

- The model is trained using a custom loss function, combining the data-driven loss and physics-based residuals.
- Optimizers like Adam are used to minimize the loss function.
- The network learns to predict Mars' seismic velocity profile while adhering to the physics of wave propagation.

## Code Flow Summary

| **Step**             | **Description**                                     | **Function Used**                  |
| -------------------- | --------------------------------------------------- | ---------------------------------- |
| Data Preprocessing   | Load and preprocess seismic data                    | `load_and_preprocess_data()`       |
| PINN Architecture    | Build and train the physics-informed neural network | `ImprovedMarsSeismicPINN`          |
| Residual Calculation | Compute the wave equation residuals                 | `compute_wave_equation_residual()` |
| Training             | Train the model with a physics-based loss function  | Custom training loop               |

## Future Enhancements

- Model Expansion: Implement more sophisticated models, such as deep convolutional neural networks (CNNs), to further refine predictions.
- Incorporating Additional Physical Laws: Extend the model to integrate additional physical constraints, such as the density profile of Mars' interior, for more accurate predictions.
- Real-time Seismic Data Integration: Adapt the model for use with real-time seismic data to allow dynamic predictions of Mars' seismic properties.

By combining deep learning with physics-informed loss functions, this module offers a robust approach for modeling Mars' seismic velocity profile, leveraging both empirical data and physical constraints for more reliable and accurate predictions.
