### Installation 

1. Backup your config. By running
```bash
cd ~/.config/neofetch/ && rename config.conf configbackup.conf config.conf
```
you save your current config in the file `configbackup.conf`.

2. Clone this repository by running
```bash
git clone https://github.com/Chick2D/neofetch-themes/
```
in your preferred folder.

3. Run 
```bash
cat neofetch-themes/<folder>/<file> > ~/.config/neofetch/config.conf
```
where `<folder>` is the section in this readme, while `<file>` is the file name of the config of this theme.
> For example: If you want papirus, it'd be
```
cat neofetch-themes/normal/papirus.conf > ~/.config/neofetch/config.conf
```
