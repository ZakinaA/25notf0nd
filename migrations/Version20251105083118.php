<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20251105083118 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE contrat_pret CHANGE eleves_id eleves_id INT NOT NULL');
        $this->addSql('ALTER TABLE contrat_pret RENAME INDEX idx_contrat_eleves TO IDX_1FB84C67C2140342');
        $this->addSql('ALTER TABLE cours DROP FOREIGN KEY FK_FDCA7C9CBAB22EE9');
        $this->addSql('DROP INDEX IDX_FDCA7C9CBAB22EE9 ON cours');
        $this->addSql('ALTER TABLE cours ADD heure_debut TIME NOT NULL, ADD heure_fin DATE NOT NULL, DROP typeId');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE contrat_pret CHANGE eleves_id eleves_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE contrat_pret RENAME INDEX idx_1fb84c67c2140342 TO IDX_contrat_eleves');
        $this->addSql('ALTER TABLE cours ADD typeId INT DEFAULT NULL, DROP heure_debut, DROP heure_fin');
        $this->addSql('ALTER TABLE cours ADD CONSTRAINT FK_FDCA7C9CBAB22EE9 FOREIGN KEY (typeId) REFERENCES type (id)');
        $this->addSql('CREATE INDEX IDX_FDCA7C9CBAB22EE9 ON cours (typeId)');
    }
}
