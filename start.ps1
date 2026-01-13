powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
uv python install 3.14

uv pip install `
    numpy `
    pandas `
    matplotlib `
    scikit-learn `
    torch `
    torchvision `
    torchaudio `
    transformers `
    scipy `
    tqdm
