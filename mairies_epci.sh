#!/usr/bin/env bash

set -u

URL='http://lecomarquage.service-public.fr/donnees_locales_v2/all_latest.tar.bz2'
ANNUAIRE_FILE_NAME='annuaire.tar.bz2'
XSLT_FILE_NAME='to_csv.xslt'
MAIRIES_CSV_FILE_NAME='mairies.csv'
EPCI_CSV_FILE_NAME='epci.csv'
MAIRIE_FILE_PATTERN='mairie-*.xml'
EPCI_FILE_PATTERN='epci-*.xml'
TMP_DIR='.tmp'
CUR_DIR="$(PWD)"

if [ ! -f "${XSLT_FILE_NAME}" ]
then
	echo "xslt file not found: ${XSLT_FILE_NAME}"
	exit
fi

if [ -z "${TMP_DIR}" ]
then
	echo "temporary directory must be specified"
	exit
fi

if [ -d "${TMP_DIR}" ]
then
	rm -rf "${TMP_DIR}"
fi	

mkdir "${TMP_DIR}"
cd "${TMP_DIR}"

echo
echo "### recuperation de l'Annuaire de l'administration de Service Public"
curl -L -o "${ANNUAIRE_FILE_NAME}" "${URL}"

if [ ! -f "${ANNUAIRE_FILE_NAME}" ]
then
	echo "failed to download data"
	exit;
fi

echo
echo "### extraction des donnees"
if [ ! $(tar -jxf "${ANNUAIRE_FILE_NAME}" --include "*/${MAIRIE_FILE_PATTERN}" --include "*/${EPCI_FILE_PATTERN}") == 0 ]
then
	echo "failed to extract data"
	exit
fi

cd "${CUR_DIR}"

echo
echo "### generation du csv des mairies"
true > "${MAIRIES_CSV_FILE_NAME}"
for f in $(find "${TMP_DIR}" -iname "${MAIRIE_FILE_PATTERN}")
do
	echo "$(xsltproc "${XSLT_FILE_NAME}" "${f}" | tr -d '\n')" >> "${MAIRIES_CSV_FILE_NAME}"
done

echo
echo "### generation du csv des epci"
true > "${EPCI_CSV_FILE_NAME}"
for f in $(find "${TMP_DIR}" -iname "${EPCI_FILE_PATTERN}")
do
	echo "$(xsltproc "${XSLT_FILE_NAME}" "${f}" | tr -d '\n')" >> "${EPCI_CSV_FILE_NAME}"
done

rm -rf "${TMP_DIR}"

