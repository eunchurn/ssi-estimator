# Stochastic subspace identification

- Output only modal identification method using covariance-driven stochastic subspace identification.
- Canonical variate analysis(CVA, covariance-driven) weighting and balanced realization (BR) weighting.
- Ref. [Covariance-driven Stochastic Subspace Identification of an End-supported Pontoon Bridge Under Varying Environmental Conditions](https://ntnuopen.ntnu.no/ntnu-xmlui/bitstream/handle/11250/2479566/imac17-kvale-preprint.pdf?sequence=1)

## Sensor & DAQ

- LORD Sensing Microstrain [G-Link-LXRS](https://www.microstrain.com/wireless/g-link) Low-cost Intergrated Accelerometer node
- Test data: Measured bridge cable acceleration in South Korea

### Sensor Features

- On-board high-speed triaxial ± 2 g or ± 10 g MEMS accelerometer with an internal temperature sensor
- Wireless framework is ideal for measuring vibration, tilt, inclination, and acceleration in remote applications.
- Supports continuous, burst, and event-triggered sampling and datalogging to internal memory
- User-programmable sample rates up to 4096 Hz
- 2 MB on-board non-volatile data storage
- Simultaneously transmit real-time data and log to memory.
- IP65/66 environmental enclosures available

## Analysis (MATLAB)

```matlab
function [na_freq, modevec, xi, na_freq_cov, modevec_cov, xi_cov, estVarBRfreq, estVarBRzeta] = simple_ssi_estimator(data,Fs,freqband,minorder,maxorder)
```

### Input arguments

- `data`: N-columns data (acceleration)
- `Fs`: sampling rate (Hz)
- `freqband`: 2-colums, N-rows vector: ROI freqencies bandwidth
- `minorder`: SVDs minimum order (truncated)
- `maxorder`: SVDs maximum order

### Output arguments

- `na_freq`
- `modevec`
- `xi`
- `na_freq_cov`
- `modevec_cov`
- `xi_cov`
- `estVarBRreq`
- `estVarBRzeta`

## Getting started

- `run.m`: plot time-series, power spectral density and SSI analysis
