# Check if a package name is provided, otherwise exit
if [ -z "$1" ]; then
    echo "Please provide a package name as an argument."
    return 1
fi

package=$1

# Initialize a flag to indicate that the package wasnot found in any environement
noPackageFound=true    

# Loop through each environment
conda env list | awk '!/^#/ {print $1}' | while read -r env; do
    # Skip empty lines
    if [ -z "$env" ]; then
        continue
    fi

    # Initialize a flag to indicate if the environment name has been printed
    printedEnvName=false

    # Find matches for the package in the environment
    conda list -n "$env" | grep -i "$package" | while read -r pkg; do
        # Print the environment name only once if a match is found
        if [ "$printedEnvName" = false ]; then
            echo "Packages for conda environment: $env"
            printedEnvName=true
            noPackageFound=false
        fi
        echo "$pkg"
    done

    # Print a blank line if any matches were found for readability
    if [ "$printedEnvName" = true ]; then
        echo
    fi
done

# Print in case the package wasn't found in any environment
if [ "$noPackageFound" = true ]; then
    echo "No conda environment has the package: $package"
    return 2
fi

return 0