---
external help file: PSTranslate-help.xml
Module Name: PSTranslate
online version:
schema: 2.0.0
---

# Set-TranslationProviderOption

## SYNOPSIS
Set provider-specific options.

## SYNTAX

```
Set-TranslationProviderOption [[-Provider] <String>] [[-ExtraHeader] <Hashtable>]
 [[-ExtraQueryParameter] <Hashtable>] [[-ExtraPostBody] <Hashtable>] [-Register] [<CommonParameters>]
```

## DESCRIPTION
Set provider-specific options to use with Invoke-RestMethod.
Know options for Azure would
be the regionality of the Cognitive Services that is passed in the header Ocp-Apim-Subscription-Region

## EXAMPLES

### EXAMPLE 1
```
Set-TranslationProviderOption -Provider Azure -ExtraHeader @{'Ocp-Apim-Subscription-Region' = 'westeurope'} -Register
```

Adds regional header for Azure Cognitive Services

## PARAMETERS

### -ExtraHeader
The additional headers to add.

```yaml
Type: Hashtable
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ExtraPostBody
The extra body content to add to a post if post is used.

```yaml
Type: Hashtable
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ExtraQueryParameter
The query parameters to add.

```yaml
Type: Hashtable
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Provider
The translation service to use.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: (Get-PSFConfigValue -FullName 'PSTranslate.DefaultProvider')
Accept pipeline input: False
Accept wildcard characters: False
```

### -Register
Persist the provider options, so they will be remembered in future sessions.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
