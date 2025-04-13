import matplotlib.pyplot as plt
from enum import Enum


class ChartType(Enum):
    LINE = 'line'
    BAR = 'bar'
    SCATTER = 'scatter'


def make_chart(dataframe, x_column, y_column, chart_type=ChartType.LINE, title='', xlabel='', ylabel=''):
    try:
        if chart_type == ChartType.LINE:
            plt.plot(dataframe[x_column], dataframe[y_column])
        elif chart_type == ChartType.BAR:
            plt.bar(dataframe[x_column], dataframe[y_column])
        elif chart_type == ChartType.SCATTER:
            plt.scatter(dataframe[x_column], dataframe[y_column])
        else:
            print(f"Chart type '{chart_type}' not supported.")
            return

        plt.title(title)
        plt.xlabel(xlabel)
        plt.ylabel(ylabel)
        plt.xticks(range(0, len(dataframe[x_column]), 3), rotation=45)

        plt.show()
    except Exception as e:
        print(f"Error creating chart: {e}")
