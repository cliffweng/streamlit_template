# Streamlit Template

Last updated in June 2024

### Clone this repo
Clone this repo to your local machine, and replace all the 'wengs' with your name, and 'streamlit-template' with your repo name.

### Add/Remove Pages
Add a new page by adding a new python file in the `pages` folder

### Modify the requirements.txt
Add or remove the required packages

## Development with Docker
Run the following commands to build the dev docker image and run the container that use local files throughout development process:
```
podman build -t st .
podman run -p 8501:8501 -p 8888:8888 --name st -v %cd%:/home/streamlit st
```
Use the following command to interactive with the containers
```
podman exec -it wd bash  // enter the container
podman exec st pip install xxx // install package, or run other command
podman start -a st // start the container with attach mode (if you want to see the stdout)
```
### Jupyter
run the following command in another prompt to start a Jupyter if you want to use Jupyter to debug
```
podman exec st pip install jupyterlab
podman exec st jupyter lab --allow-root
```

## Concepts
- [API Reference](https://docs.streamlit.io/library/api-reference)
- [State](https://docs.streamlit.io/library/advanced-features/session-state)
- [Pages](https://blog.streamlit.io/introducing-multipage-apps/)
- [Custom Components](https://docs.streamlit.io/library/components)
- [Caching](https://docs.streamlit.io/en/stable/caching.html)
- [Data Sources](https://docs.streamlit.io/knowledge-base/tutorials/databases)

## Notes
- Packages installed with Streamlit. [reference here](https://github.com/streamlit/streamlit/blob/develop/lib/setup.py)
- If you bind-mount into a non-empty directory on the container, the directory’s existing contents are obscured by the bind mount. [reference](https://docs.docker.com/storage/bind-mounts/#mount-into-a-non-empty-directory-on-the-container)