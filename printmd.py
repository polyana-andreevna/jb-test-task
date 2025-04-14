from IPython.display import display, Markdown


def printmd(string):
    display(Markdown(string))


def printdf(df, index=False):
    printmd(df.to_markdown(index=index))
