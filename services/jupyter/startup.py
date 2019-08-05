# Show output of each python line separately
from IPython.core.interactiveshell import InteractiveShell
InteractiveShell.ast_node_interactivity = "all"
# Load matplotlib to enable drawing plots of the data in the notebook
import matplotlib.pyplot as plt
# Enable the MDSplus magics %tcl and %tdi and import the MDSplus objects and functions
import MDSplus.magic
from MDSplus import *
