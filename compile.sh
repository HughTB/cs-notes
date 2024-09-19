#!/bin/sh

ROOT_DIR=$PWD
TEX_ENGINE=xelatex

cd $ROOT_DIR/1st-year/m30231-netwk/
echo "Compiling m30231-netwk"
$TEX_ENGINE m30231.tex

cd $ROOT_DIR/2nd-year/m21270-dsalg/
echo "Compiling m21270-dsalg"
$TEX_ENGINE m21270.tex

cd $ROOT_DIR/2nd-year/m21274-dmafp/
echo "Compiling m21274-dmafp"
$TEX_ENGINE m21274.tex

cd $ROOT_DIR/2nd-year/m30233-osint/
echo "Compiling m30233-osint"
$TEX_ENGINE m30233.tex

cd $ROOT_DIR/2nd-year/m30235-paapl/
echo "Compiling m30235-paapl"
$TEX_ENGINE m30235.tex

cd $ROOT_DIR/2nd-year/m30239-ehack/
echo "Compiling m30239-ehack"
$TEX_ENGINE m30239.tex

cd $ROOT_DIR/2nd-year/m30819-setap/
echo "Compiling m30819-setap"
$TEX_ENGINE m30819.tex

cd $ROOT_DIR/3rd-year/m21276-theoc/
echo "Compiling m21276-theoc"
$TEX_ENGINE m21276.tex

cd $ROOT_DIR/3rd-year/m21279-adnet/
echo "Compiling m21279-adnet"
$TEX_ENGINE m21279.tex

cd $ROOT_DIR/3rd-year/m30225-disas/
echo "Compiling m30225-disas"
$TEX_ENGINE m30225.tex

cd $ROOT_DIR/3rd-year/m30226-intot/
echo "Compiling m30226-intot"
$TEX_ENGINE m30226.tex

cd $ROOT_DIR