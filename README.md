# lagpad operator

##### Description

The `lagpad_operator` computes a lagged version of a data series along columns, shifting the data back by a given number of observations.

##### Usage

Input projection|.
---|---
`y-axis`        | data series
`column`        | factor, units of observations

Input parameters|.
---|---
`k`        | The number of lags (in units of observations corresponding to columns).

Output relations|.
---|---
`lagged`        | lagged data series

##### Details

Examples: 
* the [1, 2, 3] series with k = 1 would be transformed as [2, 3, NA] along columns
* the [1, 2, 3] series with k = -1 would be transformed as [1, 2, NA] along columns

##### See Also

[shift_operator](https://github.com/tercen/shift_operator)

