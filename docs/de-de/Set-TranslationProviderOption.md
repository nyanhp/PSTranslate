---
external help file: PSTranslate-help.xml
Module Name: PSTranslate
online version:
schema: 2.0.0
---

# Set-TranslationProviderOption

## SYNOPSIS
Konfiguriert anbieterbezogene Besonderheiten

## SYNTAX

```
Set-TranslationProviderOption [[-Provider] <String>] [[-ExtraHeader] <Hashtable>]
 [[-ExtraQueryParameter] <Hashtable>] [[-ExtraPostBody] <Hashtable>] [-Register] [<CommonParameters>]
```

## DESCRIPTION
Konfiguriert anbieterbezogene Besonderheiten die für Invoke-RestMethod verwendet werden.
Um beispielsweise regionale Azure Cognitive Services zu konfigurieren, muss der
Header Ocp-Apim-Subscription-Region verwendet werden.

## EXAMPLES

### EXAMPLE 1
```
Set-TranslationProviderOption -Provider Azure -ExtraHeader @{'Ocp-Apim-Subscription-Region' = 'westeurope'} -Register
```

Regionalen Header für Azure Cognitive Services konfigurieren.

## PARAMETERS

### -ExtraHeader
Die Header, die hinzugefügt werden sollen.

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
Der Post-Body, der hinzugefügt werden soll.

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
Die Query-Parameter, die hinzugefügt werden sollen.

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
Der Übersetzungsanbieter, für den Konfigurationen hinterlegt werden sollen

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
Optionen registrieren, so dass sie später automatisch zu Verfügung stehen.

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
Dieses Cmdlet unterstützt die Common Parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, und -WarningVariable. Weitere Informationen: [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
