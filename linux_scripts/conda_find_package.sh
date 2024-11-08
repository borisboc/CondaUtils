# Check if a package name is provided, otherwise exit
if [ -z "$1" ]; then
    echo "Please provide a package name as an argument."
    return 1
fi

package=$1
noPackageFound=true  # Initialize a flag to track if the package is found

# Loop through each environment
for env in $(conda env list | awk '!/^#/ {print $1}'); do
    # Search for matches in the current environment
    matches=$(conda list -n "$env" | grep -i "$package")
    
    # Check if there are matches
    if [ -n "$matches" ]; then
        echo "Packages for conda environment: $env"
        echo "$matches"
        echo
        noPackageFound=false
    fi
done

# Print if no environments contain the package
if [ "$noPackageFound" = true ]; then
    echo "No conda environment has the package: $package"
    return 2
fi

return 0