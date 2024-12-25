# URL de l'API pour récupérer une image de chat aléatoire
$APIURL = "https://api.thecatapi.com/v1/images/search"

# Ajouter votre clé API ici (obtenue depuis The Cat API)
$APIKey = "YOUR_API_KEY"

Try {
    # Appel API
    $response = Invoke-RestMethod -Uri $APIURL -Headers @{ "x-api-key" = $APIKey } -Method Get

    # Vérifier si la réponse contient une image
    if ($response -and $response[0]) {
        # Extraire les dimensions de l'image
        $width = $response[0].width
        $height = $response[0].height

        # Afficher les dimensions
        Write-Output "Dimensions du chat aléatoire :"
        Write-Output "Largeur : $width px"
        Write-Output "Hauteur : $height px"
    } else {
        Write-Output "Aucune image de chat reçue."
    }
}
Catch {
    # Afficher un message d'erreur
    Write-Output "Erreur lors de l'appel API : $($_.Exception.Message)"
}
