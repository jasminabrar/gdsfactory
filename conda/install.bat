
set PIP_FIND_LINKS="https://whls.blob.core.windows.net/unstable/index.html"

cd ..\condabin
call conda activate

call pip install sax jax sklearn
call pip install "jaxlib[cuda111]" -f https://whls.blob.core.windows.net/unstable/index.html --use-deprecated legacy-resolver
call pip install gdsfactory[cad]==7.4.1 gplugins

call conda install -c conda-forge slepc4py=*=complex* -y
call conda install -c conda-forge git -y
call pip install femwell

call python shortcuts.py

if exist "%USERPROFILE%\Desktop\gdsfactory" (goto SKIP_INSTALL)
cd %USERPROFILE%\Desktop
call git clone https://github.com/gdsfactory/gdsfactory.git

:SKIP_INSTALL
echo gdsfactory installed
