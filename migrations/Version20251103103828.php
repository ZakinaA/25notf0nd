<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20251103103828 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE contrat_pret ADD eleves_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE contrat_pret ADD CONSTRAINT FK_1FB84C67C2140342 FOREIGN KEY (eleves_id) REFERENCES eleves (id)');
        $this->addSql('CREATE INDEX IDX_1FB84C67C2140342 ON contrat_pret (eleves_id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE contrat_pret DROP FOREIGN KEY FK_1FB84C67C2140342');
        $this->addSql('DROP INDEX IDX_1FB84C67C2140342 ON contrat_pret');
        $this->addSql('ALTER TABLE contrat_pret DROP eleves_id');
    }
}
