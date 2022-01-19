[![Deployment](https://github.com/devgioele/personal-pwa/actions/workflows/deployment.yml/badge.svg)](https://github.com/devgioele/personal-pwa/actions/workflows/deployment.yml)

# devgio.xyz

My personal website using [Next.js](https://nextjs.org/) to let people know who I am
and what I do.

## DevOps

One goal of this website is to experiment with different DevOps techniques to deploy code.
This allows me to expand my knowledge base and get insight into the advantages and disadvantages 
of various solutions.

### Requirements

The key requirement is **portability**, meaning that the infrastructure must be easy to change.
Scalability is less important, as the number of users of this web app are predicted to be fairly low.

Because I want to keep the possibility of self-hosting the website on an embedded system, like the Raspberry Pi,
Docker Compose turned out to be very convenient.
Adding a small DB in the future should be straightforward.

After all...
> Good design is easy to change

![Architecture](documentation/personal-pwa-architecture.svg)

### Rejected alternatives 

If I had chosen Google's App Engine or Kubernetes Engine, I would have lost portability, as such an infrastructure
is not reproducible on a single-machine setup.

### Encountered difficulties

Terraform is a great tool to separate concerns and abstract the infrastructure. When the required resources are available
as Terraform resources, the development is accelerated since developers do not have to learn how to use the GUI of the
hosting provider.

However, the resources Terraform provides for the Google Cloud Platform were hard to understand.
The documentation of all the different resource arguments could be more detailed.

Furthermore, the way Google designed its cloud service does not fit well with Terraform interface. To use Terraform,
I had to create an "admin" project. This project persists across creations/destruction of infrastructure and gives
Terraform the permissions to provision resources.

## TODOs

