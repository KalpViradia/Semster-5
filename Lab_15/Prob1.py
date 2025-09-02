import networkx as nx
import matplotlib.pyplot as plt

# Example: create a random graph
G = nx.erdos_renyi_graph(30, 0.1)

# --- Degree Distribution ---
degrees = [d for n, d in G.degree()]
plt.hist(degrees, bins=range(max(degrees)+2), align='left', rwidth=0.8)
plt.xlabel("Degree")
plt.ylabel("Count")
plt.title("Degree Distribution")
plt.show()

# --- Eigenvector Centrality ---
eig_centrality = nx.eigenvector_centrality(G)
values = list(eig_centrality.values())

plt.bar(range(len(values)), values)
plt.xlabel("Node")
plt.ylabel("Eigenvector Centrality")
plt.title("Eigenvector Centrality of Nodes")
plt.show()
