{ lib
, azure-core
, buildPythonPackage
, cryptography
, fetchPypi
, isodate
, msrest
, pythonOlder
, typing-extensions
}:

buildPythonPackage rec {
  pname = "azure-storage-file-share";
  version = "12.16.0";
  format = "setuptools";

  disabled = pythonOlder "3.7";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-QS+35sPCj29yKvmBlapZQHqqMjI6+hOkoB9i0Lh3TrM=";
  };

  propagatedBuildInputs = [
    azure-core
    cryptography
    isodate
    typing-extensions
  ];

  # Tests require checkout from monorepo
  doCheck = false;

  pythonImportsCheck = [
    "azure.core"
    "azure.storage"
  ];

  meta = with lib; {
    description = "Microsoft Azure File Share Storage Client Library for Python";
    homepage = "https://github.com/Azure/azure-sdk-for-python";
    changelog = "https://github.com/Azure/azure-sdk-for-python/blob/azure-storage-file-share_${version}/sdk/storage/azure-storage-file-share/CHANGELOG.md";
    license = licenses.mit;
    maintainers = with maintainers; [ kamadorueda ];
  };
}
