# Beneficial Ownership Engine

Beneficial Ownership Engine aims to detect and visualize the implicit connections between entities and activities to support situational awareness and targeted action. Applications include identifying risks due to adversarial activities (e.g., corruption and collusion) hidden within large datasets of corporate and government entity metadata and activity records.

Given a collection of streaming data sources describing the attributes and actions of real-world entities, the Beneficial Ownership Engine uses a range of graph modeling, joint graph embedding [[1-3]](#references), and other statistical techniques to detect and explain the networks of entities most closely related to each entity.

To prioritize the expert review of these entity networks, entities can be linked to "risk signals" that indicate the need for inspection. Risk signals may be signs of either opportunities ("green flags") or risks ("red flags") due to the relationships between entities. The more risk signals in an entity network, the higher the risk and the priority for review of that network of entities.

For each entity in the dataset, the Beneficial Ownership Engine generates a report illustrating the detected relationships and risk signals contributing to its overall risk. In typical use, these reports inform real-world actions targeted at either the entity or its broader network.

Beneficial Ownership Engine consists of three components:

1. Processing Pipeline: Python package that manages processing of the seven (7) required input files using graph modeling techniques to detect networks of closely-related entities.
2. Web Server & API: A web server and API for querying the results produced by the Beneficial Ownership Processing pipeline.
3. Power BI and HTML Reports: A [Beneficial Ownership Power BI template](https://github.com/mbarnettHMX/beneficial-ownership-engine/tree/main/powerbi) is provided for reviewing Beneficial Ownership Engine results, and a React-based web server can be deployed to enable generation of entity narrative reports that can also be exported to PDF file format.

## Getting Started

There are two deployment options for the Beneficial Ownership Engine:

1. Azure Synapse deployment, and
2. Local deployment.

Efficient processing is important for the Beneficial Ownership Engine, especially for large datasets, thus the Azure Synapse deployment is reccommended.

For Azure Synapse deployment refer to the [Synapse Deployment Instructions](https://github.com/mbarnettHMX/beneficial-ownership-engine/blob/main/docs/deployment/SYNAPSE_DEPLOY.md) document.

For local deployment on a laptop, desktop, or virtual machine, follow the instructions in [Local Deployment Instructions](https://github.com/mbarnettHMX/beneficial-ownership-engine/blob/main/docs/deployment/LOCAL_DEPLOY.md).

## Web Server and API for Reporting Generation

### Installation

To install the dependencies needed for the web server and API, execute the following commands from the `python/api-backend` folder:

```bash
pip install poetry
poetry install
```

To run the backend web server and API execute from the root of the project:

```bash
docker-compose up backend_api --build
```

To run the UI, you can either use `docker-compose` or install node and yarn and execute the following commands from the root of the project:

```bash
yarn
yarn build
yarn start # run the webapp locally
```

The web server can now be accessed at http://localhost:3000

## References

1. Alexander Modell, Ian Gallagher, Joshua Cape, and Patrick Rubin-Delanchy. "Spectral embedding and the latent geometry of multipartite networks." arXiv preprint arXiv:2202.03945 (2022).

2. Nick Whiteley, Annie Gray, and Patrick Rubin-Delanchy. "Matrix factorisation and the interpretation of geodesic distance." Advances in Neural Information Processing Systems 34 (2021): 24-38.

3. Ian Gallagher, Andrew Jones, and Patrick Rubin-Delanchy. "Spectral embedding for dynamic networks with stability guarantees." Advances in Neural Information Processing Systems 34 (2021): 10158-10170.

## Contributing

This project welcomes contributions and suggestions.  Most contributions require you to agree to a Contributor License Agreement (CLA) declaring that you have the right to, and actually do, grant us the rights to use your contribution. For details, visit https://cla.opensource.microsoft.com.

When you submit a pull request, a CLA bot will automatically determine whether you need to provide a CLA and decorate the PR appropriately (e.g., status check, comment). Simply follow the instructions provided by the bot. You will only need to do this once across all repos using our CLA.

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/). For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.
